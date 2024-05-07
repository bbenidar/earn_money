import 'package:flutter/material.dart';

//primary
const Color primary = Color(0xFF106AF3);
const Color blueLight = Color(0xFF7AA7EC);

//Emerald
const Color emerald1 = Color(0xFFC0A975);

//Corn
const Color corn1 = Color(0xFFFFF569);

//Radical Red
const Color radicalRed1 = Color(0xFFE30147);

//St Patricks Blue
const Color stPatricksBlue = Color(0xFFB1CEDE);

//Light Salmon
const Color lightSalmon = Color(0xFFDCDBB8);

//Green
const Color green = Color(0xFF60C18E);

//Grey shade
const Color grey1100 = Color(0xFFFFFFFF);
const Color grey1000 = Color(0xFFE8E9EB);
const Color grey900 = Color(0xFFD0D3D6);
const Color grey800 = Color(0xFFB8BDC2);
const Color grey700 = Color(0xFFA0A7AD);
const Color grey600 = Color(0xFF889098);
const Color grey500 = Color(0xFF717B84);
const Color grey400 = Color(0xFF5A6570);
const Color grey300 = Color(0xFF414F5B);
const Color grey200 = Color(0xFF2A3947);
const Color grey100 = Color(0xFF122332);

extension CustomColorTheme on ThemeData {
  //text
  Color get color1 => brightness == Brightness.light ? grey700 : grey500;
  Color get color2 => brightness == Brightness.light ? grey800 : grey400;
  Color get color3 => brightness == Brightness.light ? grey900 : grey300;
  Color get color4 => brightness == Brightness.light ? grey1000 : grey200;
  Color get color7 => brightness == Brightness.light ? grey200 : grey1000;
  Color get color8 => brightness == Brightness.light ? grey300 : grey900;
  Color get color9 => brightness == Brightness.light ? grey400 : grey800;
  Color get color10 => brightness == Brightness.light ? grey500 : grey700;
  Color get color11 => brightness == Brightness.light ? grey1100 : grey100;
  Color get color12 => brightness == Brightness.light ? grey100 : grey1100;

  LinearGradient get colorLinearBottom => const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color.fromRGBO(31, 41, 51, 0),
          Color.fromRGBO(31, 41, 51, 0.1),
          Color.fromRGBO(31, 41, 51, 0.1),
          Color.fromRGBO(31, 41, 51, 0.1),
          Color.fromRGBO(31, 41, 51, 0.1),
          grey200
        ],
      );

  LinearGradient get colorLinearTop => const LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
        colors: [
          Color.fromRGBO(31, 41, 51, 0),
          Color.fromRGBO(31, 41, 51, 0.1),
          Color.fromRGBO(31, 41, 51, 0.1),
          Color.fromRGBO(31, 41, 51, 0.1),
          Color.fromRGBO(31, 41, 51, 0.1),
          grey200
        ],
      );
  LinearGradient get colorLinearBottom2 => const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color.fromRGBO(31, 41, 51, 0),
          Color.fromRGBO(31, 41, 51, 0.3),
          Color.fromRGBO(31, 41, 51, 0.7),
          Color.fromRGBO(31, 41, 51, 1),
        ],
      );
}
