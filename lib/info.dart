import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

import 'components.dart';


class InfoScreen extends StatefulWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  void customLaunch(command) async
  {
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
      backgroundColor: Color(0xFF282828),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Align(
              alignment: Alignment(0, 0),
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: Text(
                  'For any query',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Color(0xFFE6E0E5),
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment(0, 0),
              child: Padding(
                padding: EdgeInsets.fromLTRB(10, 40, 0, 30),
                child: Text(
                  'You can call or whatsapp on these numbers.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Color(0xFFE6E0E5),
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Stack(
              children: [
                Align(
                  alignment: Alignment(-0.3, 0),
                  child: Container(
                    width: 120,
                    height: 120,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      'images/gold_coin.jpg',
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0.3, 0),
                  child: Container(
                    width: 120,
                    height: 120,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      'images/silver_coin.jpg',
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 30,
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
                  onPressed: () {
                    customLaunch('tel: 9359640033');
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
                                '9359640033',
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
            Spacer(),
            Align(
              alignment: Alignment(0,0),
              child: Text(
                'Developed by',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Color(0xFF706C6C),
                ),
              ),
            ),
            Align(
              alignment: Alignment(0,0),
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
                child: Text(
                  'Orijeet Mukherjee',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
