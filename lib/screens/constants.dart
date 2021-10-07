import 'package:flutter/material.dart';

const List<Widget> goldPageWidgets=[
  Align(
    alignment: Alignment(0.9, 0),
    child: Padding(
      padding: EdgeInsets.only(top: 20,right: 3),
      child: Text(
        'Refresh',
        style: TextStyle(
          fontFamily: 'Poppins',
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
  ),
  Center(
    child: Padding(
      padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
      child: Text(
        'GOLD COINS',
        style: TextStyle(
          fontFamily: 'Poppins',
          color: Color(0xFFEBC480),
          fontSize: 30,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  ),
  Center(
    child: Padding(
      padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
      child: Text(
        'Types of Coins',
        style: TextStyle(
          fontFamily: 'Poppins',
          color: Color(0xFFEBC480),
          fontSize: 30,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  )
];

const List<Widget> silverPageWidgets=[
  Align(
    alignment: Alignment(0.9, 0),
    child: Padding(
      padding: EdgeInsets.only(top: 20,right: 3),
      child: Text(
        'Refresh',
        style: TextStyle(
          fontFamily: 'Poppins',
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
  ),
  Center(
    child: Padding(
      padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
      child: Text(
        'SILVER COINS',
        style: TextStyle(
          fontFamily: 'Poppins',
          color: Color(0xFFE6E0E5),
          fontSize: 30,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  ),
  Center(
    child: Padding(
      padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
      child: Text(
        'Types of Coins',
        style: TextStyle(
          fontFamily: 'Poppins',
          color: Color(0xFFE6E0E5),
          fontSize: 30,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  )
];

const Color goldColor=Color(0xFFEBC480);

const Color silverColor=Color(0xFFE6E0E5);

const String whatsappMessage='Hey i am interested in buying a coin!';
const String whatsappNumber='9049641882';
const String phoneNumber='9359640033';

List<Widget> infoPageWidgets=[
  Padding(
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
  Spacer(),
  Text(
    'Developed by',
    style: TextStyle(
      fontFamily: 'Poppins',
      color: Color(0xFF706C6C),
    ),
  ),
  Padding(
    padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
    child: Text(
      'Orijeet Mukherjee',
      style: TextStyle(
        fontFamily: 'Poppins',
        color: Colors.white,
      ),
    ),
  )
];