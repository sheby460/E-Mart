
import 'package:emart_app/consts/consts.dart';
import 'package:flutter/cupertino.dart';

Widget featureButton ({String? title,icon}){
  return Row(
    children: [
     Image.asset(imgS1, width: 40, fit: BoxFit.fill,),
      10.widthBox,
       title!.text.color(fontGrey).fontFamily(semibold).make(),
    ],
  ).box.width(200).margin(
      const EdgeInsets.symmetric(horizontal: 4)
  ).white.padding(const EdgeInsets.all(8)).roundedSM.outerShadowSm.make();
}