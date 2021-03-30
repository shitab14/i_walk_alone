import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flame/util.dart';
import 'package:flame_splash_screen/flame_splash_screen.dart';
import 'package:flutter/services.dart';
import 'package:i_walk_alone/GameScreens/GamePlayScreen/GamePlayScreen.dart';
import 'package:splashscreen/splashscreen.dart';


void main() {
  runApp(MyApp());
  SystemChrome.setEnabledSystemUIOverlays([]);
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreenGame(),
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SplashScreenGame extends StatefulWidget {
  @override
  _SplashScreenGameState createState() => _SplashScreenGameState();
}

class _SplashScreenGameState extends State<SplashScreenGame> {

  FlameSplashController controller;
  @override
  void initState() {
    super.initState();
    controller = FlameSplashController(
        fadeInDuration: Duration(seconds: 1),
        fadeOutDuration: Duration(milliseconds: 250),
        waitDuration: Duration(seconds: 2),
        autoStart: false
    );
  }

  @override
  void dispose() {
    controller.dispose(); // dispose it when necessary
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashScreen(
        backgroundColor: Colors.yellow,
        seconds: 5,
        loaderColor: Colors.transparent,
        title: new Text(
          'Welcome In SplashScreen',
          style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
          navigateAfterSeconds: new MyGamePlayScreen(),

      ),

    );
  }
}
