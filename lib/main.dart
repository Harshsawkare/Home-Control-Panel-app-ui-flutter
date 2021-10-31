import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:harsh21rdfpp/navigation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    return MaterialApp(
      title: 'Home Control',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  void _navigateToHome() async {
    await Future.delayed(Duration(milliseconds: 3000), () {});
    Navigator.push(context, MaterialPageRoute(
        builder: (context) =>  Navigation()
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade900,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [

            Positioned.fill(
                child: Image.asset("images/circles.png", fit: BoxFit.cover,)
            ),

            Align(
              alignment: Alignment(0,-0.1),
              child: Image.asset("images/icon_power_off.png", fit: BoxFit.cover, width: 20, height: 20,)
            ),

            Align(
                alignment: Alignment(0,0),
                child: Text("Home Control",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),)
            ),

            Align(
                alignment: Alignment(0,0.95),
                child: Text("HarshSawkare21RDFPP",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                  ),)
            ),
          ],
        ),
      ),
    );
  }
}

