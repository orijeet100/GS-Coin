import 'package:flutter/material.dart';
import 'package:gold_app/BuyingScreen.dart';

class CoinCardSilver extends StatelessWidget {
  final int coinWeight;
  final String price;
  final int coinLeft;
  CoinCardSilver({required this.coinWeight,required this.price,required this.coinLeft});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        color: Color(0xFF323131),
        elevation: 7,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: TextButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>BuyingScreen(pricing: price, isGold: false, weight: coinWeight,)));
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Click on any card to whatsapp or call',
                style: TextStyle(
                  fontSize:17
                ),
                ),
                action: SnackBarAction(onPressed: () {  }, label: 'Close',
                  textColor: Colors.yellow,
                ),
                duration: Duration(seconds: 4),
              ),
            );
          },
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 10),
                  child: Hero(
                    tag: '$coinWeight false',
                    child: CircleAvatar(
                      radius:60,
                      backgroundImage: AssetImage(
                        'images/silver_coin.jpg',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: Alignment(0, 0),
                        child: Text(
                          '${coinWeight}g Coin',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment(0, 0),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: Text(
                            '$price INR',
                            style:
                            TextStyle(
                              fontFamily: 'Poppins',
                              color: Color(0xFFE6E0E5),
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment(0, 0),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: coinLeft!=0?Text(
                            '$coinLeft coins left',
                            style:
                            TextStyle(
                              fontFamily: 'Poppins',
                              color: Color(0xFF858085),
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ):Text(
                            'SOLD OUT',
                            style:
                            TextStyle(
                              fontFamily: 'Poppins',
                              color: Color(0xFFEF444B),
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                          ,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CoinCardGold extends StatelessWidget {
  final int coinWeight;
  final String price;
  final int coinLeft;
  CoinCardGold({required this.coinWeight,required this.price,required this.coinLeft});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        color: Color(0xFF323131),
        elevation: 7,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: TextButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>BuyingScreen(pricing: price, isGold: true, weight: coinWeight,)));
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Click on any card for Whatsapp or Call',
                  style: TextStyle(
                      fontSize:17
                  ),
                ),
                action: SnackBarAction(onPressed: () {  }, label: 'Close',
                  textColor: Colors.yellow,
                ),
              ),
            );
          },
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 10),
                  child: Hero(
                    tag: '$coinWeight true',
                    child: CircleAvatar(
                      radius:60,
                      backgroundImage: AssetImage(
                        'images/gold_coin.jpg',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: Alignment(0, 0),
                        child: Text(
                          '${coinWeight}g Coin',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Color(0xFFEBC480),
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment(0, 0),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: Text(
                            '$price INR',
                            style:
                            TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment(0, 0),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: coinLeft!=0?Text(
                            '$coinLeft coins left',
                            style:
                            TextStyle(
                              fontFamily: 'Poppins',
                              color: Color(0xFF897747),
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ):Text(
                            'SOLD OUT',
                            style:
                            TextStyle(
                              fontFamily: 'Poppins',
                              color: Color(0xFFEF444B),
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatefulWidget {

  final String text;
  final bool isGold;
  CustomTextField({required this.text,required this.isGold});
  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
   TextEditingController textController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.2,
              height: MediaQuery.of(context).size.width * 0.2,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                widget.isGold?'images/gold_coin.jpg':'images/silver_coin.jpg',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
            child: Text(
              widget.text,
              style: TextStyle(
                fontFamily: 'Poppins',
                color: widget.isGold?Color(0xFFEBC480):Color(0xFFE6E0E5),
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: TextFormField(
                onChanged: (_) => setState(() {}),
                controller: textController,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: '',
                  hintStyle: TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.grey,
                    fontSize: 10,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFD7C1C1),
                      width: 1,
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFD7C1C1),
                      width: 1,
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                  ),
                  suffixIcon: InkWell(
                    onTap: () => setState(
                          () => textController.clear(),
                    ),
                    child: Icon(
                      Icons.clear,
                      color: Color(0xFF757575),
                      size: 22,
                    ),
                  ),
                ),
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontSize: 25,
                ),
                keyboardType: TextInputType.number,
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'Field is required';
                  }

                  return null;
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

const Color goldColor=Color(0xFFEBC480);

const Color silverColor=Color(0xFFE6E0E5);

const String whatsappMessage='Hey i am interested in buying a coin!';
const String whatsappNumber='9049641882';
const String phoneNumber='9359640033';