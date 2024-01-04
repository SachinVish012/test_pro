import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:test_pro/res/content/app_text.dart';
import 'dart:math' as math;
import '../res/colors/colors.dart';

class CircularIndicatorHome extends StatefulWidget {
  const CircularIndicatorHome({super.key});

  @override
  State<CircularIndicatorHome> createState() => _CircularIndicatorHomeState();
}

class _CircularIndicatorHomeState extends State<CircularIndicatorHome> {
  int activePage = 0;
  String saveAmount="0";
  String goalAmount="0";
  String savingAmount="0";
  String monthSaveAmount="0";
  DatabaseReference ref = FirebaseDatabase.instance.ref('data');

  @override
  initState(){
    super.initState();
    firebaseDataCall();
  }

  firebaseDataCall() async {
    final goal1 = await ref.child('goalAmount').get();
    final monthAmount1 = await ref.child('monthlySaving').get();
    final saveAmount1 = await ref.child('saveAmount').get();
    final savingAmount1 = await ref.child('savingAmount').get();
    print(goal1.value);
    if(goal1.value!=null&&monthAmount1.value!=null&&saveAmount1.value!=null&&savingAmount1.value!=null)
      {
        print("not null");
        setState(() {
          saveAmount=saveAmount1.value.toString();
          goalAmount=goal1.value.toString();
          savingAmount=savingAmount1.value.toString();
          monthSaveAmount=monthAmount1.value.toString();
        });
      }
  }

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
      margin: EdgeInsets.only(top: height1/16),
      child: Column(
        children: [

          //------for circular indicator
          CircularStepProgressIndicator(
            totalSteps: 100,
            currentStep: 20,
            //stepSize: 1,
            selectedColor: AppColors.dashwhite,
            unselectedColor: AppColors.circularIndClr1,
            // padding: math.pi / 80,
            width: 160,
            height: 160,
            startingAngle: -math.pi * 2 / 1.5,
            arcSize: math.pi * 2 / 3 * 2,
            roundedCap: (_, __) => true,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed:(){
                      print("Home Pressed");
                      //firebasewrite();
                    },
                    icon: Icon(Icons.home,color: AppColors.textWhite,size: 60,)
                ),
                Container(
                  width: width1/3,
                  alignment: Alignment.topCenter,
                  child: text1(context, "\u{20B9}"+saveAmount, AppColors.textWhite,18,FontWeight.bold)
                ),
                Container(
                  child:
                  text1(context, AppText.youSaved, AppColors.circularIndClr1,16,FontWeight.normal)
                )
              ],
            ),
          ),


          //----------for pagignation
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: indicators(5,activePage)
          ),

          //-------------- Data
          Container(
            margin: EdgeInsets.only(top: 15,left: 15,right: 15),
            child: CarouselSlider(
              items: [
                SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20,right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Flexible(
                                flex: 4,
                                child:Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      alignment: Alignment.topLeft,
                                      child: text1(context, AppText.goalText, AppColors.textWhite,18,FontWeight.normal)
                                    ),
                                    Container(
                                      alignment: Alignment.topLeft,
                                      child: text1(context, "by Jan 2024", AppColors.circularIndClr1, 10, FontWeight.normal)
                                    ),
                                  ],
                                )
                            ),
                            Flexible(
                                flex: 2,
                                child: Container()
                            ),
                            Flexible(
                                flex: 4,
                                child: Container(
                                  alignment: Alignment.topRight,
                                  child: text1(context, "\u{20B9}"+goalAmount, AppColors.textWhite, 18, FontWeight.normal)
                                )
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: AppColors.dashBlue2
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 5,right: 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Flexible(
                                      flex: 6,
                                      child:Container(
                                        alignment: Alignment.topLeft,
                                        child: text1(context, AppText.needSaving, AppColors.textWhite, 14, FontWeight.normal)
                                      )
                                  ),
                                  Flexible(
                                      flex: 4,
                                      child: Container(
                                        alignment: Alignment.topRight,
                                        child: text1(context, "\u{20B9}"+savingAmount, AppColors.textWhite, 14, FontWeight.normal)
                                      )
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top:5,left: 5,right: 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Flexible(
                                      flex: 6,
                                      child:Container(
                                        alignment: Alignment.topLeft,
                                        child: text1(context, AppText.monthlySaving, AppColors.textWhite, 14, FontWeight.normal)
                                      )
                                  ),
                                  Flexible(
                                      flex: 4,
                                      child: Container(
                                        alignment: Alignment.topRight,
                                        child: text1(context, "\u{20B9}"+monthSaveAmount, AppColors.textWhite, 14, FontWeight.normal)
                                      )
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
              options: CarouselOptions(
                height: height1 / 5,
                enlargeCenterPage: false,
                autoPlay: false,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(
                    milliseconds: 800),
                viewportFraction: 1,
                initialPage: 2,
                onPageChanged: (index, reason) {
                  setState(() {
                    activePage = index;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  //----text widget
  Widget text1(BuildContext context,String text,color,double size,bold){
    return Container(
      child: Text(text,style: TextStyle(color: color,fontSize: size,fontWeight: bold,)),
    );
  }

  List<Widget> indicators(imagesLength, currentIndex) {
    return List<Widget>.generate(imagesLength, (index) {
      return Container(
        margin: EdgeInsets.all(3),
        width: 10,
        height: 10,
        decoration: BoxDecoration(
            color: currentIndex == index ? AppColors.dashwhite : Colors
                .black26,
            shape: BoxShape.circle),
      );
    });
  }
}
