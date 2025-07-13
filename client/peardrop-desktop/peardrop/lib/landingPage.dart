import 'package:flutter/material.dart';

import 'modeSwitchPage.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _landingPage(context);
  }
}

Widget _landingPage(context) {
  return Scaffold(
    appBar: AppBar(
      toolbarHeight: 72,
      title: Text(
        "PearDrop",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
      ),
      shadowColor: Colors.black,
      elevation: 0.0,
      backgroundColor: Colors.white,
    ),
    body: Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Row(
        children: [
          Column(
            children: [
              Expanded(child: SizedBox(height: 493)),
              Container(
                margin: EdgeInsets.only(left: 21),
                child: Text(
                  "Share ,\nUnconditionally .",
                  softWrap: true,
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(),
              alignment: Alignment.centerRight,
              child: Image.asset("assets/images/PearImage.png"),
            ),
          ),
        ],
      ),
    ),
    bottomNavigationBar: Container(
      decoration: BoxDecoration(color: Colors.white),
      child: GestureDetector(
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => ModeSwitchPage()),
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              constraints: BoxConstraints(maxWidth: 343.0),
              height: 65,
              width: 343,

              decoration: BoxDecoration(
                color: Color.fromARGB(255, 81, 169, 37),
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              margin: EdgeInsets.only(left: 12, right: 12, top: 57, bottom: 20),
              alignment: Alignment.center,
              child: Text(
                "Start",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Roboto",
                  fontSize: 30.0,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
