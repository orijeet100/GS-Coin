import 'package:flutter/material.dart';
import 'package:gold_app/screens/info_screen.dart';
import 'package:gold_app/screens/loading_screen.dart';
import 'package:intl/intl.dart';
import 'package:gold_app/components.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../constants.dart';


class GoldSilverScreen extends StatefulWidget {
  final coinData;
  final map;
  GoldSilverScreen({this.coinData,this.map});
  @override
  _GoldSilverScreenState createState() => _GoldSilverScreenState();
}

class _GoldSilverScreenState extends State<GoldSilverScreen> with TickerProviderStateMixin{
  late AnimationController animationController;
  late double rate1;
  late double rate2;
  late int rateGold;
  late int rateSilver;
  late int oneSilver;
  late int twoSilver;
  late int fiveSilver;
  late int tenSilver;
  late int oneGold;
  late int twoGold;
  late int fiveGold;
  late int tenGold;
  var formatter = NumberFormat('#,##,000');
  final FirebaseFirestore firestore=FirebaseFirestore.instance;

  @override
  void initState() {
    rate1=(widget.coinData['rates']['XAU']/28.35);
    rate2=(widget.coinData['rates']['XAG']/28.35);
    rateGold=rate1.round();
    rateSilver=rate2.round();
    animationController =
    new AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    animationController.repeat(reverse: true);

    ///number of coins available

    oneSilver=widget.map['OneSilver'];
    twoSilver=widget.map['TwoSilver'];
    fiveSilver=widget.map['FiveSilver'];
    tenSilver=widget.map['TenSilver'];
    oneGold=widget.map['OneGold'];
    twoGold=widget.map['TwoGold'];
    fiveGold=widget.map['FiveGold'];
    tenGold=widget.map['TenGold'];
    super.initState();
  }

  ///Rate of each coin
  late String oneGramGold=formatter.format(rateGold);
  late String twoGramGold=formatter.format(rateGold*2);
  late String fiveGramGold=formatter.format(rateGold*5);
  late String tenGramGold=formatter.format(rateGold*10);
  late String oneGramSilver=formatter.format(rateSilver);
  late String twoGramSilver=formatter.format(rateSilver*2);
  late String fiveGramSilver=formatter.format(rateSilver*5);
  late String tenGramSilver=formatter.format(rateSilver*10);

  int currentSelected=0;
  PageController pc=PageController();
  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(items:
      [
        BottomNavigationBarItem(icon: Padding(padding: EdgeInsets.only(bottom: 5 ),child: Text('Au',style: TextStyle(fontSize: 20,color:(currentSelected!=0?Colors.white24:Colors.white)))),label:'Gold'),
        BottomNavigationBarItem(icon:Padding(padding: EdgeInsets.only(bottom: 5 ),child: Text('Ag',style: TextStyle(fontSize: 20,color:(currentSelected!=1?Colors.white24:Colors.white) ))),label:'Silver'),
        BottomNavigationBarItem(icon: Icon(Icons.info_outline),label:'Info')
      ],
        backgroundColor: Color(0xFF323131),
        currentIndex: currentSelected,
        onTap: (index)
        {
          setState(() {
            currentSelected=index;
            pc.animateToPage(index, duration: Duration(milliseconds: 200), curve: Curves.linear);
          });
        },
        unselectedItemColor: Colors.white24,
        selectedItemColor: Colors.white,

      ),
      backgroundColor: Color(0xFF282828),
      body: SafeArea(
        child: PageView(
          controller: pc,
          scrollDirection: Axis.horizontal,
          children: [
            ListView(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              children: [
                goldPageWidgets[0],
                Align(
                  alignment: Alignment(1, 0),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 7, 15, 0),
                    child: Container(
                      height: 40,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Color(0xFF1E1D1D),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: MaterialButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>LoadingScreen()));
                      }, child: Icon(
                        Icons.refresh,
                        color: Colors.white,
                        size: 30,
                      ),
                        elevation: 10,
                      ),
                    ),

                  ),
                ),
                goldPageWidgets[1],
                GoldAnimationCard(animationController: animationController, costPerTenGram: tenGramGold),
                goldPageWidgets[2],
                CoinCardGold(coinWeight: 1,coinLeft: oneGold,price: oneGramGold),
                CoinCardGold(coinWeight: 2,coinLeft: twoGold,price: twoGramGold),
                CoinCardGold(coinWeight: 5,coinLeft: fiveGold,price: fiveGramGold),
                CoinCardGold(coinWeight: 10,coinLeft: tenGold,price: tenGramGold),
                SizedBox(width: double.infinity,height: 20,)
              ],
            ),
            ListView(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              children: [
                silverPageWidgets[0],
                Align(
                  alignment: Alignment(1, 0),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 7, 15, 0),
                    child: Container(
                      height: 40,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Color(0xFF1E1D1D),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: MaterialButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>LoadingScreen()));
                      }, child: Icon(
                        Icons.refresh,
                        color: Colors.white,
                        size: 30,
                      ),
                        elevation: 10,
                      ),
                    ),

                  ),
                ),
                silverPageWidgets[1],
                SilverAnimationCard(animationController: animationController, costPerTenGram: tenGramSilver),
                silverPageWidgets[2],
                CoinCardSilver(coinWeight: 1,coinLeft: oneSilver,price: rateSilver.toString()),
                CoinCardSilver(coinWeight: 2,coinLeft: twoSilver,price: twoGramSilver),
                CoinCardSilver(coinWeight: 5,coinLeft: fiveSilver,price: fiveGramSilver),
                CoinCardSilver(coinWeight: 10,coinLeft: tenSilver,price: tenGramSilver),
                SizedBox(width: double.infinity,height: 20,)
              ],
            ),
            InfoScreen(),
          ],
          physics: BouncingScrollPhysics(),
          onPageChanged: (index){
            setState(() {
              currentSelected=index;
            });
          },
        )
      ),
    );
  }
}


