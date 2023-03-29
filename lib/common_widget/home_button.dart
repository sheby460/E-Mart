import 'package:emart_app/consts/consts.dart';
import 'package:flutter/cupertino.dart';

Widget homeButton({width, height, icon,String? tittle, onPress}) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(icon, width: 26,),
        10.heightBox,
        tittle!.text.fontFamily(semibold).color(darkFontGrey).make(),
      ],
    ).box.rounded.white.size(width, height).make();

}