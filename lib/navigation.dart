import 'package:flutter/material.dart';
import 'package:harsh21rdfpp/bulbs.dart';
import 'package:harsh21rdfpp/home.dart';
import 'package:harsh21rdfpp/settings.dart';

class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  Widget Body = Home();
  DateTime? currentBackPressTime;

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      return Future.value(false);
    }
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(

        body: Body,

        bottomNavigationBar: Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          color: Colors.white,
          child: Row(
            children: [
              Expanded(child: Container()),
              GestureDetector(
                  child: Image.asset("images/icon_bulb.png", width: 40, height: 40,),

                onTap: (){
                    setState(() {
                      Body = Bulbs();
                    });
                },
              ),
              Expanded(child: Container()),
              GestureDetector(
                  child: Image.asset("images/icon_feather_home.png", width: 40, height: 40,),

                onTap: (){
                  setState(() {
                    Body = Home();
                  });
                },
              ),
              Expanded(child: Container()),
              GestureDetector(
                  child: Image.asset("images/icon_feather_settings.png", width: 40, height: 40,),

                onTap: (){
                  setState(() {
                    Body = Settings();
                  });
                },
              ),
              Expanded(child: Container()),
            ],
          ),
        ),
      ),
    );
  }
}
