import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:harsh_21rdfpp/navigation.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  bool controlPanel = true;
  int roomIndex = 0;
  int lightType = 1;
  Color bulbColor = Colors.yellow.shade300;
  double value = 0;
  Color dimColor = Colors.black87;
  bool glow = false;
  bool powerOn = false;

  List<String> images = [
    "images/bedroom.png",
    "images/room.png",
    "images/kitchen.png",
    "images/bathtube.png",
    "images/house.png",
    "images/balcony.png",
  ];

  List<String> rooms = [
    "Bed Room",
    "Living Room",
    "Kitchen",
    "Bathroom",
    "Outdoor",
    "Balcony",
  ];

  List<String> lights = [
    "4 Lights",
    "2 Lights",
    "5 Lights",
    "1 Light",
    "5 Lights",
    "2 Lights",
  ];


  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..forward();

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  //backpressed
  Future<bool> _onBackPressed() async {
    setState(() {
      controlPanel = true;
    });
    return true;
  }
  
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        backgroundColor: Colors.indigo.shade900,
        body: Stack(
          children: [
            //background circles
            Image.asset("images/circles.png",height: 300, fit: BoxFit.cover,),

            //control room/room/user picture
            Align(
              alignment: Alignment(0, -0.9),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    GestureDetector(
                      child: Row(
                        children: [
                          if(!controlPanel)
                            Icon(Icons.arrow_back_ios_rounded, color: Colors.white,),
                          controlPanel ?
                          Text(
                            "Control Panel",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.bold),
                          ) :
                          Text(rooms.elementAt(roomIndex),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.bold),
                          ),
                          Expanded(child: SizedBox()),
                          controlPanel ? Image.asset(
                            "images/user.png",
                            width: 125,
                            height: 125,
                          ) : SizedBox(width: 125,height: 125,)
                        ],
                      ),

                      onTap: (){
                        setState(() {
                          controlPanel = true;
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Navigation()));
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),

            //no. of lights in room
            if(!controlPanel)
              AlignTransition(
                alignment: Tween<AlignmentGeometry>(
                  begin: Alignment(-0.7,-0.85),
                  end: Alignment(-0.7,-0.65),
                ).animate(
                  CurvedAnimation(
                    parent: _controller,
                    curve: Curves.decelerate,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Row(
                    children: [
                      Text(
                        lights.elementAt(roomIndex),
                        style: TextStyle(
                            color: Colors.orange.shade700,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            //lamp
            new AnimatedPositioned(
              width: 130,
              height: 130,
              top: controlPanel ? -130 : 0,
              right: 20,
              curve: Curves.easeInOut,
              duration: Duration(seconds: 1),
              child: Container(
                child: Column(
                  children: [
                    Image.asset("images/light_bulb_new.png",height: 100, fit: BoxFit.cover,),
                    Stack(
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            width: 30,
                            height: 15,
                            decoration: BoxDecoration(
                                color: bulbColor.withOpacity(0.5),
                                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15))
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            width: 20,
                            height: 10,
                            decoration: BoxDecoration(
                                color: bulbColor,
                                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15))
                            ),
                          ),
                        ),

                        //dimming color
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            width: 30,
                            height: 15,
                            decoration: BoxDecoration(
                                color: dimColor,
                                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15))
                            ),
                          ),
                        ),

                        //power on off
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            width: 30,
                            height: 15,
                            decoration: BoxDecoration(
                                color: powerOn ? Colors.black : Colors.transparent,
                                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15))
                            ),
                          ),
                        ),


                      ],
                    ),
                  ],
                ),
              ),
            ),

            //type of light in room : selection row
            new AnimatedPositioned(
              duration: Duration(seconds: 2),
              curve: Curves.easeInOut,
              width: MediaQuery.of(context).size.width,
              height: 60,
              top: 140,
              left: controlPanel ? MediaQuery.of(context).size.width : 0,
              child: Container(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: GestureDetector(
                          child: Container(
                            height: 50,
                            width: 125,
                            decoration: BoxDecoration(
                                color: lightType == 1 ? Colors.transparent : Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: lightType == 1 ? Colors.white : Colors.indigo.shade900,)
                            ),
                            child: Row(
                              children: [
                                Expanded(child: Container()),
                                Image.asset(lightType == 1 ? "images/surface2.png" : "images/surface1.png",height: 20, width: 20, fit: BoxFit.cover,),
                                Expanded(child: Container()),
                                Text("Main Light",
                                  style: TextStyle(
                                      color: lightType == 1 ? Colors.white : Colors.indigo.shade900,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Expanded(child: Container()),
                              ],
                            ),
                          ),
                          onTap: (){
                            setState(() {
                              lightType = 1;
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: GestureDetector(
                          child: Container(
                            height: 50,
                            width: 125,
                            decoration: BoxDecoration(
                                color: lightType == 2 ? Colors.transparent : Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: lightType == 2 ? Colors.white : Colors.indigo.shade900,)
                            ),
                            child: Row(
                              children: [
                                Expanded(child: Container()),
                                Image.asset(lightType == 2 ? "images/furniture_and_household.png" : "images/furniture_and_household2.png",height: 20, width: 20, fit: BoxFit.cover,),
                                Expanded(child: Container()),
                                Text("Desk Light",
                                  style: TextStyle(
                                      color: lightType == 2 ? Colors.white : Colors.indigo.shade900,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Expanded(child: Container()),
                              ],
                            ),
                          ),
                          onTap: (){
                            setState(() {
                              lightType = 2;
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: GestureDetector(
                          child: Container(
                            height: 50,
                            width: 125,
                            decoration: BoxDecoration(
                                color: lightType == 3 ? Colors.transparent : Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: lightType == 3 ? Colors.white : Colors.indigo.shade900,)
                            ),
                            child: Row(
                              children: [
                                Expanded(child: Container()),
                                Image.asset(lightType == 3 ? "images/bed2.png" : "images/bed.png",height: 20, width: 20, fit: BoxFit.cover,),
                                Expanded(child: Container()),
                                Text("Bed Side",
                                  style: TextStyle(
                                      color: lightType == 3 ? Colors.white : Colors.indigo.shade900,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Expanded(child: Container()),
                              ],
                            ),
                          ),
                          onTap: (){
                            setState(() {
                              lightType = 3;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            //main body
            new AnimatedPositioned(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              top: controlPanel ? 120 : 200,
              curve: Curves.easeInOut,
              duration: Duration(seconds: 1),
              child: Stack(
                children: [

                  Positioned.fill(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.indigo.shade50,
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
                        ),
                        child: controlPanel ?

                            //control panel
                            Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              child: Row(
                                children: [
                                  Text(
                                    "All Rooms",
                                    style: TextStyle(
                                        color: Colors.indigo.shade900,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                child: SingleChildScrollView(
                                  physics: BouncingScrollPhysics(),
                                  child: Column(
                                    children: [
                                      GridView.count(
                                        physics: ScrollPhysics(),
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 10.0,
                                        mainAxisSpacing: 10.0,
                                        shrinkWrap: true,
                                        children: List.generate(6, (index) {
                                          return GestureDetector(
                                            child: Card(
                                              elevation: 7,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(25)),
                                              color: Colors.white,
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.only(
                                                        left: 20, top: 20, bottom: 20),
                                                    child: Row(
                                                      children: [
                                                        Image.asset(
                                                            images.elementAt(index)),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                    const EdgeInsets.only(left: 20),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          rooms.elementAt(index),
                                                          style: TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 20,
                                                              fontWeight:
                                                              FontWeight.bold),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(
                                                        left: 20, top: 5, bottom: 5),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          lights.elementAt(index),
                                                          style: TextStyle(
                                                              color: Colors.orange,
                                                              fontSize: 16,
                                                              fontWeight:
                                                              FontWeight.bold),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),

                                            onTap: () {
                                              setState(() {
                                                controlPanel = false;
                                                roomIndex = index;
                                              });
                                            },
                                          );
                                        },
                                        ),
                                      ),

                                      Container(height: 200, color: Colors.transparent,)
                                    ],
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ) :

                            //room
                            SingleChildScrollView(
                              physics: BouncingScrollPhysics(),
                              child: Column(
                          children: [

                              //intensity
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                                child: Row(
                                  children: [
                                    Text(
                                      "Intensity",
                                      style: TextStyle(
                                          color: Colors.indigo.shade900,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  children: [
                                    Image.asset("images/solution2.png", height: 50,),
                                    Expanded(
                                        child: Slider(
                                          value: value,
                                          min: 0,
                                          max: 5,
                                          divisions: 5,
                                          activeColor: Colors.orange.shade300,
                                          inactiveColor: Colors.grey.shade300,
                                          onChanged: (double newValue) {
                                            setState(() {
                                              value = newValue;

                                              if(newValue > 2)
                                                glow = true;
                                              else
                                                glow = false;

                                              if(newValue == 0)
                                                dimColor = Colors.black87;

                                              if(newValue == 1)
                                                dimColor = Colors.black54;

                                              if(newValue == 2)
                                                dimColor = Colors.black45;

                                              if(newValue == 3)
                                                dimColor = Colors.black38;

                                              if(newValue == 4)
                                                dimColor = Colors.black12;

                                              if(newValue == 5)
                                                dimColor = Colors.transparent;

                                            });
                                          },
                                        )
                                    ),
                                    Image.asset(glow ? "images/solution.png" : "images/solution1.png", height: 50,),
                                  ],
                                ),
                              ),

                              //colors
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                                child: Row(
                                  children: [
                                    Text(
                                      "Colors",
                                      style: TextStyle(
                                          color: Colors.indigo.shade900,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                                child: Container(
                                  height: 30,
                                  width: MediaQuery.of(context).size.width,
                                  child: Stack(
                                    children: [
                                      GestureDetector(
                                        child: Container(
                                          width: 30,
                                          height: 30,
                                          decoration: BoxDecoration(
                                              color: Colors.orange.shade300,
                                              borderRadius: BorderRadius.circular(15)
                                          ),
                                        ),
                                        onTap: (){
                                          setState(() {
                                            bulbColor = Colors.orange.shade300;
                                          });
                                        },
                                      ),

                                      AlignTransition(
                                        alignment: Tween<AlignmentGeometry>(
                                          begin: Alignment(-1,0),
                                          end: Alignment(-0.7,0),
                                        ).animate(
                                          CurvedAnimation(
                                            parent: _controller,
                                            curve: Curves.decelerate,
                                          ),
                                        ),
                                        child: GestureDetector(
                                          child: Container(
                                            width: 30,
                                            height: 30,
                                            decoration: BoxDecoration(
                                                color: Colors.green.shade300,
                                                borderRadius: BorderRadius.circular(15)
                                            ),
                                          ),
                                          onTap: (){
                                            setState(() {
                                              bulbColor = Colors.green.shade300;
                                            });
                                          },
                                        ),
                                      ),

                                      AlignTransition(
                                        alignment: Tween<AlignmentGeometry>(
                                          begin: Alignment(-1,0),
                                          end: Alignment(-0.4,0),
                                        ).animate(
                                          CurvedAnimation(
                                            parent: _controller,
                                            curve: Curves.decelerate,
                                          ),
                                        ),
                                        child: GestureDetector(
                                          child: Container(
                                            width: 30,
                                            height: 30,
                                            decoration: BoxDecoration(
                                                color: Colors.blue.shade300,
                                                borderRadius: BorderRadius.circular(15)
                                            ),
                                          ),
                                          onTap: (){
                                            setState(() {
                                              bulbColor = Colors.blue.shade300;
                                            });
                                          },
                                        ),
                                      ),

                                      AlignTransition(
                                        alignment: Tween<AlignmentGeometry>(
                                          begin: Alignment(-1,0),
                                          end: Alignment(-0.1,0),
                                        ).animate(
                                          CurvedAnimation(
                                            parent: _controller,
                                            curve: Curves.decelerate,
                                          ),
                                        ),
                                        child: GestureDetector(
                                          child: Container(
                                            width: 30,
                                            height: 30,
                                            decoration: BoxDecoration(
                                                color: Colors.purple.shade300,
                                                borderRadius: BorderRadius.circular(15)
                                            ),
                                          ),
                                          onTap: (){
                                            setState(() {
                                              bulbColor = Colors.purple.shade300;
                                            });
                                          },
                                        ),
                                      ),

                                      AlignTransition(
                                        alignment: Tween<AlignmentGeometry>(
                                          begin: Alignment(-1,0),
                                          end: Alignment(0.2,0),
                                        ).animate(
                                          CurvedAnimation(
                                            parent: _controller,
                                            curve: Curves.decelerate,
                                          ),
                                        ),
                                        child: GestureDetector(
                                          child: Container(
                                            width: 30,
                                            height: 30,
                                            decoration: BoxDecoration(
                                                color: Colors.pink.shade300,
                                                borderRadius: BorderRadius.circular(15)
                                            ),
                                          ),
                                          onTap: (){
                                            setState(() {
                                              bulbColor = Colors.pink.shade300;
                                            });
                                          },
                                        ),
                                      ),

                                      AlignTransition(
                                        alignment: Tween<AlignmentGeometry>(
                                          begin: Alignment(-1,0),
                                          end: Alignment(0.5,0),
                                        ).animate(
                                          CurvedAnimation(
                                            parent: _controller,
                                            curve: Curves.decelerate,
                                          ),
                                        ),
                                        child: GestureDetector(
                                          child: Container(
                                            width: 30,
                                            height: 30,
                                            decoration: BoxDecoration(
                                                color: Colors.yellow.shade300,
                                                borderRadius: BorderRadius.circular(15)
                                            ),
                                          ),
                                          onTap: (){
                                            setState(() {
                                              bulbColor = Colors.yellow.shade300;
                                            });
                                          },
                                        ),
                                      ),

                                      AlignTransition(
                                        alignment: Tween<AlignmentGeometry>(
                                          begin: Alignment(-1,0),
                                          end: Alignment(0.8,0),
                                        ).animate(
                                          CurvedAnimation(
                                            parent: _controller,
                                            curve: Curves.decelerate,
                                          ),
                                        ),
                                        child: Container(
                                          width: 30,
                                          height: 30,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(15)
                                          ),
                                          child: Center(
                                            child: Image.asset("images/plus.png", width: 20, height: 20, fit: BoxFit.cover,),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              //scenes
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                                child: Row(
                                  children: [
                                    Text(
                                      "Scenes",
                                      style: TextStyle(
                                          color: Colors.indigo.shade900,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 10, left: 20, right: 20),
                                child: Container(
                                  height: 60,
                                  width: MediaQuery.of(context).size.width,
                                  child: Stack(
                                    children: [
                                      GestureDetector(
                                        onTap: (){
                                          setState(() {
                                            bulbColor = Colors.orange.shade300;
                                          });
                                        },
                                        child: Container(
                                          height: 60,
                                          width: 150,
                                          decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                  begin: Alignment.centerLeft,
                                                  end: Alignment.centerRight,
                                                  colors: [Colors.red.shade300, Colors.orange.shade300]
                                              ),
                                              borderRadius: BorderRadius.circular(15)
                                          ),
                                          child: Row(
                                            children: [
                                              Expanded(child: Container()),
                                              Image.asset("images/surface2.png",fit: BoxFit.cover,),
                                              Expanded(child: Container()),
                                              Text("Birthday",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                ),
                                              ),
                                              Expanded(child: Container()),
                                            ],
                                          ),
                                        ),
                                      ),

                                      AlignTransition(
                                        alignment: Tween<AlignmentGeometry>(
                                          begin: Alignment(-1,0),
                                          end: Alignment(1,0),
                                        ).animate(
                                          CurvedAnimation(
                                            parent: _controller,
                                            curve: Curves.decelerate,
                                          ),
                                        ),
                                        child: GestureDetector(
                                          onTap: (){
                                            setState(() {
                                              bulbColor = Colors.purple.shade300;
                                            });
                                          },
                                          child: Container(
                                            height: 60,
                                            width: 150,
                                            decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                    begin: Alignment.centerLeft,
                                                    end: Alignment.centerRight,
                                                    colors: [Colors.deepPurple.shade300, Colors.purple.shade300]
                                                ),
                                                borderRadius: BorderRadius.circular(15)
                                            ),
                                            child: Row(
                                              children: [
                                                Expanded(child: Container()),
                                                Image.asset("images/surface2.png",fit: BoxFit.cover,),
                                                Expanded(child: Container()),
                                                Text("Party",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                                Expanded(child: Container()),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 10, left: 20, right: 20),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 60,
                                  child: Stack(
                                    children: [
                                      GestureDetector(
                                        onTap: (){
                                          setState(() {
                                            bulbColor = Colors.blue.shade300;
                                          });
                                        },
                                        child: Container(
                                          height: 60,
                                          width: 150,
                                          decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                  begin: Alignment.centerLeft,
                                                  end: Alignment.centerRight,
                                                  colors: [Colors.blue.shade400, Colors.blue.shade200]
                                              ),
                                              borderRadius: BorderRadius.circular(15)
                                          ),
                                          child: Row(
                                            children: [
                                              Expanded(child: Container()),
                                              Image.asset("images/surface2.png",fit: BoxFit.cover,),
                                              Expanded(child: Container()),
                                              Text("Relax",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                ),
                                              ),
                                              Expanded(child: Container()),
                                            ],
                                          ),
                                        ),
                                      ),

                                      AlignTransition(
                                        alignment: Tween<AlignmentGeometry>(
                                          begin: Alignment(-1,0),
                                          end: Alignment(1,0),
                                        ).animate(
                                          CurvedAnimation(
                                            parent: _controller,
                                            curve: Curves.decelerate,
                                          ),
                                        ),
                                        child: GestureDetector(
                                          onTap: (){
                                            setState(() {
                                              bulbColor = Colors.green.shade300;
                                            });
                                          },
                                          child: Container(
                                            height: 60,
                                            width: 150,
                                            decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                    begin: Alignment.centerLeft,
                                                    end: Alignment.centerRight,
                                                    colors: [Colors.green.shade300, Colors.lightGreen.shade300]
                                                ),
                                                borderRadius: BorderRadius.circular(15)
                                            ),
                                            child: Row(
                                              children: [
                                                Expanded(child: Container()),
                                                Image.asset("images/surface2.png",fit: BoxFit.cover,),
                                                Expanded(child: Container()),
                                                Text("Fun",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                                Expanded(child: Container()),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              Container(height: 300, color: Colors.transparent,)
                          ],
                        ),
                            ),
                      ),
                    ),
                  ),

                  //power button
                  if(!controlPanel)
                    Align(
                      alignment: Alignment(0.8, -1),
                      child: GestureDetector(
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(5, 5), // changes position of shadow
                                ),
                              ],
                              borderRadius: BorderRadius.circular(15)
                          ),
                          child: Center(
                            child: Icon(Icons.power_settings_new_rounded, color: powerOn ? Colors.green : Colors.red, size: 22,)
                          ),
                        ),

                        onTap: (){
                          setState(() {
                            powerOn = !powerOn;
                          });
                        },
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}
