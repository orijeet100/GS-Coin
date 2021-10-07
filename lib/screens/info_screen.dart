import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';
import 'constants.dart';


class InfoScreen extends StatelessWidget {

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
            infoPageWidgets[0],
            infoPageWidgets[1],
            infoPageWidgets[2],
            infoPageWidgets[3],
            Padding(
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
            Padding(
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
            infoPageWidgets[4],
            infoPageWidgets[5],
            infoPageWidgets[6]
          ],
        ),
      ),
    );
  }
}
