import 'package:flutter/material.dart';

class Bulbs extends StatefulWidget {
  const Bulbs({Key? key}) : super(key: key);

  @override
  _BulbsState createState() => _BulbsState();
}

class _BulbsState extends State<Bulbs> {


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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade900,
      body: Stack(
        children: [
          //background circles
          Image.asset("images/circles.png",height: 300, fit: BoxFit.cover,),

          //power consumption/user picture
          Align(
            alignment: Alignment(0, -0.9),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Power \nComsumption",
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
                    padding: const EdgeInsets.only(top: 20, left: 10, bottom: 5),
                    child: Row(
                      children: [
                        Text("Total Charges : Rs /-",
                          style: TextStyle(
                              color: Colors.indigo.shade900,
                              fontSize: 24,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                  ),

                  Expanded(
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: rooms.length,
                        itemBuilder: (context, index){
                          return Padding(
                            padding: const EdgeInsets.all(15),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 150,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15)
                              ),
                              child: Row(
                                children: [

                                  Expanded(
                                      child: Column(
                                        children: [

                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 30, top: 20, bottom: 20),
                                            child: Row(
                                              children: [
                                                Image.asset(
                                                    images.elementAt(index)),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                            const EdgeInsets.only(left: 30),
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
                                                left: 30, top: 5, bottom: 5),
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
                                      )
                                  ),

                                  Expanded(
                                      child: Column(
                                        children: [
                                          Expanded(child: Container()),
                                          Text("units",
                                            style: TextStyle(
                                                color: Colors.indigo.shade900,
                                                fontSize: 24,
                                                fontWeight:
                                                FontWeight.bold),
                                          ),
                                          Expanded(child: Container()),
                                          Text("Rs",
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 24,
                                                fontWeight:
                                                FontWeight.bold),
                                          ),
                                          Expanded(child: Container()),
                                        ],
                                      )
                                  ),

                                ],
                              ),
                            ),
                          );
                        }),
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
