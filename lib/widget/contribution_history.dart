import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../res/colors/colors.dart';
import '../res/content/app_text.dart';

class ContributionHistory extends StatefulWidget {
  const ContributionHistory({super.key});

  @override
  State<ContributionHistory> createState() => _ContributionHistoryState();
}

class _ContributionHistoryState extends State<ContributionHistory> {
  @override
  Widget build(BuildContext context) {
    var height1 = MediaQuery
        .of(context)
        .size
        .height;
    return Container(
      margin: EdgeInsets.only(top: height1/30,left: 20,right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 25,bottom: 10,right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                    flex:5,
                    child: Container(
                      alignment: Alignment.topLeft,
                      child: Text(AppText.contribution,style: TextStyle(color: AppColors.textblue,fontSize: 16,fontWeight: FontWeight.bold),),
                    )
                ),
                Flexible(
                    flex:5,
                    child: Container(
                      alignment: Alignment.topRight,
                      child: Text(AppText.showHistory,style: TextStyle(color: AppColors.textblue,fontSize: 16,fontWeight: FontWeight.bold),),
                    )
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15,right: 15),
            child: LinearPercentIndicator( //leaner progress bar
              animation: true,
              animationDuration: 1000,
              lineHeight: 10.0,
              percent:70/100,
              //linearStrokeCap: LinearStrokeCap.roundAll,
              barRadius: Radius.circular(15),
              progressColor: AppColors.dashBlue2,
              backgroundColor: Colors.yellow,
            ),
          ),

          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top:20,left: 20,right: 20),
            child:
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  flex:1,
                  child:
                  Container(
                    alignment: Alignment.centerLeft,
                    height: 9.0,
                    width: 9.0,
                    decoration: BoxDecoration(
                      color: AppColors.dashBlue2,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Flexible(
                    flex: 6,
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(left: 20),
                          child: Text(AppText.totalAmount,style: TextStyle(color: AppColors.textblue2,fontSize: 14)),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(left: 20),
                          child: Text(AppText.completionDate,style: TextStyle(color: AppColors.textblue2,fontSize: 14)),
                        ),
                      ],
                    )),
                Flexible(
                    flex: 3,
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topRight,
                          child: Text("\u{20B9}150",style: TextStyle(color: AppColors.textblue2,fontSize: 14)),
                        ),
                        Container(
                          alignment: Alignment.topRight,
                          child: Text(DateTime.now().toString().substring(0,10),style: TextStyle(color: AppColors.textblue2,fontSize: 14)),
                        ),
                      ],
                    )),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top:20,left: 20,right: 20),
            child:
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  flex:1,
                  child:
                  Container(
                    alignment: Alignment.centerLeft,
                    height: 9.0,
                    width: 9.0,
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Flexible(
                    flex: 6,
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(left: 20),
                          child: Text(AppText.totalAmount,style: TextStyle(color: AppColors.textblue2,fontSize: 14)),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(left: 20),
                          child: Text(AppText.completionDate,style: TextStyle(color: AppColors.textblue2,fontSize: 14)),
                        ),
                      ],
                    )),
                Flexible(
                    flex: 3,
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topRight,
                          child: Text("\u{20B9}150",style: TextStyle(color: AppColors.textblue2,fontSize: 14)),
                        ),
                        Container(
                          alignment: Alignment.topRight,
                          child: Text(DateTime.now().toString().substring(0,10),style: TextStyle(color: AppColors.textblue2,fontSize: 14)),
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
