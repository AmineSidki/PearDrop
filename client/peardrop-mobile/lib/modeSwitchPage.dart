import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ModeSwitchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => _modeSwitchPage(context);
}

Widget _modeSwitchPage(context) {
  return Scaffold(
    appBar: AppBar(
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "What will it be today ?",
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.normal),
              ),
            ],
          ),
          SizedBox(height: 19),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(top: 50),
                height: 302,
                width: 342,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(57, 0, 0, 0),
                      blurRadius: 10,
                      offset: Offset.fromDirection(1.57, 5.0),
                    ),
                  ],
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 85, 255, 0),
                      Color.fromARGB(255, 51, 153, 0),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 115),
                      child: SvgPicture.asset("assets/images/Arrow.svg"),
                    ),
                    SizedBox(height: 30),
                    Text(
                      "Receive",
                      style: TextStyle(
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 40.0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 23.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(top: 50),
                height: 302,
                width: 342,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(57, 0, 0, 0),
                      blurRadius: 10,
                      offset: Offset.fromDirection(1.57, 5.0),
                    ),
                  ],
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 255, 204, 0),
                      Color.fromARGB(255, 255, 115, 0),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(right: 115),
                      child: Transform.rotate(
                        angle: 3.14,
                        child: SvgPicture.asset("assets/images/Arrow.svg"),
                      ),
                    ),
                    SizedBox(height: 30),
                    Text(
                      "Send",
                      style: TextStyle(
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 40.0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
