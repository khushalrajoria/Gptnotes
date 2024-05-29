// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:chatnotes/controllers/pallete.dart';

class FeatureBox extends StatelessWidget {
  final Color color;
  final String headerText;
  final String descText;

  const FeatureBox({
    Key? key,
    required this.color,
    required this.headerText,
    required this.descText,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 35,vertical: 10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(
          Radius.circular(15)
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20).copyWith(left: 15),
        child: Column(
           children: [
             Align( alignment: Alignment.centerLeft,
              child: headerText.text.fontFamily('Cera Pro').color(Pallete.blackColor).fontWeight(FontWeight.bold).minFontSize(18).make()),
              SizedBox(height: 3),
             descText.text.fontFamily('Cera Pro').color(Pallete.blackColor).minFontSize(15).make(),
           ],
        ),
      ),
    );
  }
}
