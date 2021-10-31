import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade900,
      body: Stack(
        children: [
          //background circles
          Image.asset("images/circles.png",height: 300, fit: BoxFit.cover,),

          //settings/user picture
          Align(
            alignment: Alignment(0, -0.9),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Settings",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 34,
                            fontWeight: FontWeight.bold),
                      ),
                      Expanded(child: SizedBox()),
                      Image.asset(
                        "images/user.png",
                        width: 125,
                        height: 125,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),

          //main body
          Padding(
            padding: const EdgeInsets.only(top: 150),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.indigo.shade50,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(25),
                      topLeft: Radius.circular(25)
                  )
              ),

              child: Column(
                children: [
                  Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [

                  //add room
                  Expanded(
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)
                      ),

                      child: Column(
                        children: [
                          Expanded(child: Container()),
                          Image.asset("images/plus.png", width: 30, height: 30,),
                          Expanded(child: Container()),
                          Text("Add Room",
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 16
                          ),),
                          Expanded(child: Container()),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(width: 15,),

                  //add light
                  Expanded(
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)
                      ),

                      child: Column(
                        children: [
                          Expanded(child: Container()),
                          Image.asset("images/plus.png", width: 30, height: 30,),
                          Expanded(child: Container()),
                          Text("Add Light",
                            style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 16
                            ),),
                          Expanded(child: Container()),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),


                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      children: [

                        //logout
                        Expanded(
                          child: Container(
                            height: 150,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15)
                            ),

                            child: Row(
                              children: [
                                Expanded(child: Container()),
                                Image.asset("images/icon_power_off.png", width: 30, height: 30,),
                                SizedBox(width: 5,),
                                Text("Logout",
                                  style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: 16
                                  ),),
                                Expanded(child: Container()),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
