import 'package:emart_app/consts/consts.dart';

Widget detailsCards({width, String? count, String? title}){
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      "00".text.fontFamily(bold).color(darkFontGrey).make(),
      5.heightBox,
      "in your cart".text.color(darkFontGrey).make(),
    ],
  ).box.white.rounded.width(width).height(60).padding(const EdgeInsets.all(4)).make();
}
