import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'GoldSIlver_screen.dart';

class LoadingScreen extends StatefulWidget {

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {


  late int oneSilver;
  late int twoSilver;
  late int fiveSilver;
  late int tenSilver;
  late int oneGold;
  late int twoGold;
  late int fiveGold;
  late int tenGold;

  @override
  void initState() {
    getRates();
    super.initState();
  }

  void getRates() async
  {
    var data=await getData();
    final FirebaseFirestore firestore=FirebaseFirestore.instance;
    Map map={};
    await firestore.collection("NumberOfCoin").get().then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        map=result.data();
        oneSilver=map['OneSilver'];
        twoSilver=map['TwoSilver'];
        fiveSilver=map['FiveSilver'];
        tenSilver=map['TenSilver'];
        oneGold=map['OneGold'];
        twoGold=map['TwoGold'];
        fiveGold=map['FiveGold'];
        tenGold=map['TenGold'];
      });
    });
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>GoldSilverScreen(coinData: data,map: map)));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Tap on any card for more details',
          style: TextStyle(
              fontSize:17
          ),
        ),
        action: SnackBarAction(onPressed: () {}, label: 'Close',
          textColor: Colors.yellow,
        ),
          duration: Duration(seconds: 3)
      ),
    );
  }

  Future<dynamic> getData() async
  {
    String uri='https://www.metals-api.com/api/latest?access_key=kigea7hlc3zz2jyjw553t6s7iibdi7tb4yili7au1ra3a3845lcpeetbrjyl&base=INR&symbols=XAU%2CXAG%2CXPD%2CXPT%2CXRH';
    var uriExample = Uri.parse(uri);
    http.Response r = await http.get(uriExample);
    if (r.statusCode == 200) {
      String data = r.body;
      return jsonDecode(data);
    }
    else {
      print(r.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFF282828),
        body: SpinKitWave(
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }
}
