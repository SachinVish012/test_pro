import 'package:flutter/material.dart';
import 'package:test_pro/res/colors/colors.dart';
import '../res/content/app_text.dart';
import '../widget/bottom_white.dart';
import '../widget/circular_indicator.dart';
import '../widget/contribution_history.dart';
import '../widget/top_blue.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

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
    return Scaffold(
      backgroundColor: AppColors.topNotchClr,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            //----for top blue widget
            TopBlue(),
            //--------for bottom white widget
            BottomWhite(),
            //-----for top text
            Container(
              alignment: Alignment.topCenter,
              margin: EdgeInsets.only(top: height1/15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                 Container(
                    child: Text(
                      AppText.buyHouse,
                      style: TextStyle(color: AppColors.textWhite,fontSize: 24,fontWeight: FontWeight.bold),
                    ),
                  ),

                  //----for top widget,text,circular indicator
                  CircularIndicatorHome(),

                  //-----for bottom contribution widget
                  ContributionHistory(),
             ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
