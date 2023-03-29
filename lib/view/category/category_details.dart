import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/view/category/items_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common_widget/bg_widget.dart';

class CategoryDetailsScreen extends StatelessWidget {
  final String? title;
  const CategoryDetailsScreen({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        appBar: AppBar(
          title: title!.text.white.fontFamily(bold).make(),
        ),
        body: Container(
          padding: const EdgeInsets.all(12),
          child: Column(
            children:  [
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(6, 
                          (index) => "baby clothing".text.size(12).fontFamily(semibold).color(darkFontGrey).makeCentered()
                      .box.white.rounded.size(120, 60).margin(const EdgeInsets.symmetric(horizontal: 4)).make(),
                  ),
                ),
              ),
              
              //Items Container start here...
              Expanded(
                child: GridView.builder(
                  shrinkWrap: true,
                    itemCount: 6,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, mainAxisExtent: 250), itemBuilder: (context,index){
                  return  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                          imgP5,
                          width: 120,
                          height: 120,
                          fit: BoxFit.cover
                      ),
                      const Spacer(),
                      "Laptop 4GB/64GB".text.fontFamily(semibold).color(darkFontGrey).make(),
                      10.heightBox,
                      "Tsh 700000".text.fontFamily(bold).color(redColor).size(18).make(),

                    ],
                  ).box.white.margin(
                      const EdgeInsets.symmetric(horizontal: 4)
                  ).roundedSM.padding(const EdgeInsets.all(8)).make().onTap(() {
                    Get.to(() => const ItemsDetailsScreen(title: "Dummy Item"));
                  });

                }),
              ),
            ],
          ),
        ),
      )

    );
  }
}
