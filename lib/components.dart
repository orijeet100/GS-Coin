import 'package:flutter/material.dart';
import 'package:gold_app/screens/BuyingScreen.dart';

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

class GoldAnimationCard extends StatelessWidget {

  final animationController;
  final costPerTenGram;
  GoldAnimationCard({required this.animationController,required this.costPerTenGram});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        color: Color(0xFF282828),
        elevation: 0,
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Container(
                  width: 120,
                  height: 120,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'images/gold_brick.jpg',
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FadeTransition(
                          opacity: animationController,
                          child: Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Align(
                          alignment: Alignment(0, 0),
                          child: Text(
                            'Live Rate',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Color(0xFFEBC480),
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment(0, 0),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Text(
                          '$costPerTenGram INR per 10g',
                          style:
                          TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.white,
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
    );
  }
}

class SilverAnimationCard extends StatelessWidget {

  final animationController;
  final costPerTenGram;
  SilverAnimationCard({required this.animationController,required this.costPerTenGram});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        color: Color(0xFF282828),
        elevation: 0,
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Container(
                  width: 120,
                  height: 120,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'images/silver_brick.jpg',
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FadeTransition(
                          opacity: animationController,
                          child: Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Align(
                          alignment: Alignment(0, 0),
                          child: Text(
                            'Live Rate',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Color(0xFFE6E0E5),
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment(0, 0),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Text(
                          '$costPerTenGram INR per 10g',
                          style:
                          TextStyle(
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
              )
            ],
          ),
        ),
      ),
    );
  }
}

