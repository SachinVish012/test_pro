import 'package:flutter/material.dart';

import '../res/colors/colors.dart';

class TopBlue extends StatelessWidget {
  const TopBlue({super.key});

  @override
  Widget build(BuildContext context) {
    var height1 = MediaQuery
        .of(context)
        .size
        .height;
    var width1 = MediaQuery
        .of(context)
        .size
        .width;
    return Container(
      alignment: Alignment.topCenter,
      margin: EdgeInsets.only(top: height1 / 30),
      //color: MyAppColor.YellowButton,
      height: height1 / 1.2,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.dashBlue,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(40),
            topLeft: Radius.circular(40)
        ),
      ),
    );
  }
}
