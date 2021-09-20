import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gold_app/components.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';


class BuyingScreen extends StatefulWidget {

  BuyingScreen({required this.pricing,required this.isGold, required this.weight});
  final String pricing;
  final bool isGold;
  final int weight;
  @override
  _BuyingScreenState createState() => _BuyingScreenState();
}

class _BuyingScreenState extends State<BuyingScreen> {
  int numberOfCoins=1;
  late bool isGold;
  late int price;
  late int coinWeight;
  var formatter = NumberFormat('#,##,000');
  @override
  void initState() {
    String priceConverted=(widget.pricing).replaceAll(',', '');
    price=int.parse(priceConverted);
    isGold=widget.isGold;
    coinWeight=widget.weight;
    super.initState();
  }

  void customLaunch(command) async
  {
    var status = await Permission.contacts.status;
    if(status.isDenied)
      {
        await Permission.contacts.request();
      }
    if(await canLaunch(command))
      {
        await launch(command);
      }
    else
      {
        print('could\'t launch $command ');
      }
  }


  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF282828),
        automaticallyImplyLeading: true,
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Color(0xFF282828),
      body: SafeArea(
        child: ListView(
          children: [
            Center(
              child: Padding(
                padding:EdgeInsets.only(top: 20),
                child: Hero(
                  tag: '$coinWeight $isGold',
                  child: CircleAvatar(
                    radius:MediaQuery.of(context).size.width * 0.25,
                    backgroundImage: AssetImage(
                      isGold?'images/gold_coin.jpg':'images/silver_coin.jpg',
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 50, 20, 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    isGold?'${coinWeight}g Gold Coin':'${coinWeight}g Silver Coin',
                    style: TextStyle(
                      fontFamily: 'Playfair Display',
                      color: silverColor,
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      numberOfCoins==0?'0':(numberOfCoins==1 && isGold==false? '${(formatter.format((price)*numberOfCoins)).substring(1,3)} INR':'${(formatter.format((price)*numberOfCoins))} INR'),
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontFamily: 'Lexend Deca',
                        color: !isGold?silverColor:goldColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () { setState(() {
                      if(numberOfCoins>0)
                        {
                          numberOfCoins--;
                        }
                    }); },
                    child: Container(
                      child: Icon(FontAwesomeIcons.minus,color: Colors.black,
                        size: 20,),
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40),
                        border: Border.all(
                          color: Color(0xFFDBE2E7),
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      width: 70,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Align(
                        alignment: Alignment(0, 0.05),
                        child: Text(
                          '$numberOfCoins',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Lexend Deca',
                            color: Color(0xFF090F13),
                            fontSize: 32,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        numberOfCoins++;
                      });
                    },
                    child: Container(
                      child: Icon(FontAwesomeIcons.plus,color: Colors.black,
                        size: 20,),
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40),
                        border: Border.all(
                          color: Color(0xFFDBE2E7),
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                child: TextButton(
                  onPressed: () async{
                    final link = WhatsAppUnilink(
                      phoneNumber: '+91 $whatsappNumber',
                      text: whatsappMessage,
                    );
                    await launch('$link');
                  },
                  child: Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    color: Colors.black,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Container(
                      width: 250,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFF323131),
                          )
                        ],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                            child: Icon(
                              FontAwesomeIcons.whatsapp,
                              color: Color(0xFF13EA27),
                              size: 30,
                            ),
                          ),
                          Align(
                            alignment: Alignment(0, 0),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                              child: Text(
                                '9049641882',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Color(0xFFE6E0E5),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: TextButton(
                  onPressed: () async{
                    customLaunch('tel:$phoneNumber');
                  },
                  child: Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    color: Colors.black,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Container(
                      width: 250,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFF323131),
                          )
                        ],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                            child: Icon(
                              Icons.call,
                              color: Color(0xFF1313D4),
                              size: 30,
                            ),
                          ),
                          Align(
                            alignment: Alignment(0, 0),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                              child: Text(
                                phoneNumber,
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Color(0xFFE6E0E5),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
