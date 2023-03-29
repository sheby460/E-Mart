import 'package:emart_app/common_widget/bg_widget.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/consts/list.dart';
import 'package:emart_app/view/category/category_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        appBar: AppBar(
          title: category.text.fontFamily(bold).white.make(),
        ),
        body: Container(
          padding: const EdgeInsets.all(12),
          child: GridView.builder(
            shrinkWrap: true,
             itemCount: 9,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, mainAxisExtent: 250, mainAxisSpacing: 8, crossAxisSpacing: 8),
              itemBuilder: (context,index){
            return Column(
              children: [
                Image.asset(categoryImages[index],height: 120,width: 200,fit: BoxFit.cover),
                10.heightBox,
                categoriesList[index].text.fontFamily(semibold).color(darkFontGrey).align(TextAlign.center).make(),
              ],
            ).box.white.rounded.clip(Clip.antiAlias).outerShadowSm.make().onTap(() {
              Get.to(() => CategoryDetailsScreen(title: categoriesList[index],));
            });
          }),
        ),
      )
    );
  }
}
