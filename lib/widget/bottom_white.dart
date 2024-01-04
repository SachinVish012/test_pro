import 'package:flutter/material.dart';

import '../res/colors/colors.dart';

class BottomWhite extends StatelessWidget {
  const BottomWhite({super.key});

  @override
  Widget build(BuildContext context) {
    var height1 = MediaQuery
        .of(context)
        .size
        .height;
    return Container(
      alignment: Alignment.bottomCenter,
      margin: EdgeInsets.only(top: height1 / 1.6),
      //color: MyAppColor.YellowButton,
      height: height1 / 2.7,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.dashwhite,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(40),
            topLeft: Radius.circular(40)
        ),
      ),
    );
  }
}
