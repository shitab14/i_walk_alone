import 'dart:math';

import 'package:control_pad/control_pad.dart';
import 'package:flame/components/joystick/joystick_component.dart';
import 'package:flame/components/joystick/joystick_directional.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flame/util.dart';
import 'package:flame_splash_screen/flame_splash_screen.dart';
import 'package:flutter/services.dart';


/*const GAMEPAD_BUTTON_UP = "UP";
const GAMEPAD_BUTTON_DOWN = "DOWN";

const GAMEPAD_DPAD_UP = "UP";
const GAMEPAD_DPAD_DOWN = "DOWN";
const GAMEPAD_DPAD_LEFT = "LEFT";
const GAMEPAD_DPAD_RIGHT = "RIGHT";

const GAMEPAD_BUTTON_A = "A";
const GAMEPAD_BUTTON_B = "B";
const GAMEPAD_BUTTON_X = "X";
const GAMEPAD_BUTTON_Y = "Y";

const GAMEPAD_BUTTON_L1 = "L1";
const GAMEPAD_BUTTON_L2 = "L2";

const GAMEPAD_BUTTON_R1 = "R1";
const GAMEPAD_BUTTON_R2 = "R2";

const GAMEPAD_BUTTON_START = "START";
const GAMEPAD_BUTTON_SELECT = "SELECT";

typedef void KeyListener(RawKeyEvent event);
typedef void GamepadListener(String evtType, String key);

const ANDROID_MAPPING = {
  19: GAMEPAD_DPAD_UP,
  20: GAMEPAD_DPAD_DOWN,
  21: GAMEPAD_DPAD_LEFT,
  22: GAMEPAD_DPAD_RIGHT,
  96: GAMEPAD_BUTTON_A,
  97: GAMEPAD_BUTTON_B,
  99: GAMEPAD_BUTTON_X,
  100: GAMEPAD_BUTTON_Y,
  102: GAMEPAD_BUTTON_L1,
  103: GAMEPAD_BUTTON_R1,
  104: GAMEPAD_BUTTON_L2,
  105: GAMEPAD_BUTTON_R2,
  108: GAMEPAD_BUTTON_START,
  109: GAMEPAD_BUTTON_SELECT
};*/

class GamePlayScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GamePlayScreen(),
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyGamePlayScreen extends StatefulWidget {
  @override
  _GamePlayScreenState createState() => _GamePlayScreenState();
}


class _GamePlayScreenState extends State<MyGamePlayScreen> {

  double _boxPositionX = 30;
  double _boxPositionY = 300;

  void directionRegister(double x, double y, BuildContext context) {
    setState(() {
      double screenHeight = MediaQuery.of(context).size.height;
      double screenWidth = MediaQuery.of(context).size.width;

      _boxPositionX = _boxPositionX + x *2;
      if(_boxPositionX < 0) _boxPositionX = 0;
      if(_boxPositionX > screenHeight) _boxPositionX = screenHeight;

      _boxPositionY = _boxPositionY + y *2;
      if(_boxPositionY < 0) _boxPositionY = 0;
      if(_boxPositionY > screenWidth) _boxPositionY = screenWidth;


    });

    print("Position " + _boxPositionX.toString() +" " + _boxPositionY.toString());
  }



  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]
    );
    //startGame();

    return Scaffold(
        body: Stack(

          children: [

            Container(
              color: Colors.amberAccent,

            ),

            Positioned(
              bottom: _boxPositionX,
              left: _boxPositionY,
              child: Card(
                color: Colors.red,
                shadowColor: Colors.deepOrange,
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(60.0),
                ),
                child: Container(
                  width: 50, height:50,
                ),
              ),
            ),

            Positioned(
              bottom: 20,
              left: 25,
              child: Container(
                height: 130,
                width: 130,
                child: JoystickView(
                  size: 120,
                  opacity: 0.5,
                  backgroundColor: Colors.transparent,
                  iconsColor: Colors.transparent,
                  innerCircleColor: Colors.blueGrey,
                  showArrows: true,

                  onDirectionChanged:  (double degrees, double distanceFromCenter) {
                    double radians = degrees * pi / 180;
                    double x = cos(radians) * distanceFromCenter;
                    double y = sin(radians) * distanceFromCenter;
                    directionRegister(x,y, context);
                  },
                ),
              ),
            ),



          ],
        )
    );
  }


/*
  void startGame() async {

    BoxGame game = BoxGame();
    runApp(game.widget);

    Util flameUtil = Util();
    await flameUtil.fullScreen();
    await flameUtil.setOrientation(DeviceOrientation.landscapeLeft);
  }
*/


}


/*
class BoxGame extends Game {
  Size screenSize;

  void resize(Size size) {
    screenSize = size;
    super.resize(size);
  }

  void render(Canvas canvas) {
    Rect bgRect = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
    Paint bgPaint = Paint();
    bgPaint.color = Color(0xff000000);
    canvas.drawRect(bgRect, bgPaint);

    double screenCenterX = screenSize.width / 2;
    double screenCenterY = screenSize.height / 2;
    Rect boxRect = Rect.fromLTWH(
        screenCenterX,
        screenCenterY,
        50,
        50
    );
    Paint boxPaint = Paint();
    boxPaint.color = Color(0xffffffff);
    canvas.drawRect(boxRect, boxPaint);
  }

  void update(double t) {
    // TODO: implement update
  }
}
*/
