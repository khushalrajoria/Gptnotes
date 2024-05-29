import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Pallete {
  static const Color mainFontColor = Color.fromRGBO(19, 61, 95, 1);
  static const Color firstSuggestionBoxColor = Color.fromRGBO(165, 231, 244, 1);
  static const Color secondSuggestionBoxColor =
      Color.fromRGBO(157, 202, 235, 1);
  static const Color thirdSuggestionBoxColor = Color.fromRGBO(162, 238, 239, 1);
  static const Color assistantCircleColor = Color.fromRGBO(209, 243, 249, 1);
  static const Color borderColor = Color.fromRGBO(200, 200, 200, 1);
  static const Color blackColor = Colors.black;
  static const Color whiteColor = Colors.white;

static List<Color> cardsColor =
  [
    Colors.grey.shade100,
    Colors.red.shade100,
    Colors.pink.shade100,
    Colors.orange.shade100,
    Colors.yellow.shade100,
    Colors.green.shade100,
    Colors.blueGrey.shade100,
    
  ];

  static TextStyle mainTitle=GoogleFonts.roboto(fontSize: 18.0,fontWeight: FontWeight.bold);
  static TextStyle dateTitle=GoogleFonts.roboto(fontSize: 13.0,fontWeight: FontWeight.bold);
  static TextStyle mainContent=GoogleFonts.nunito(fontSize: 15.0,fontWeight: FontWeight.normal);
}