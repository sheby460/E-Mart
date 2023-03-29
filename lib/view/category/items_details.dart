import 'package:emart_app/common_widget/shared_button.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/consts/list.dart';
import 'package:flutter/material.dart';

import '../../consts/colors.dart';

class ItemsDetailsScreen extends StatelessWidget {
  final String? title;
  const ItemsDetailsScreen({Key? key,required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGrey,
      appBar: AppBar(
        title: title!.text.color(darkFontGrey).fontFamily(bold).make(),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.share)),
          IconButton(onPressed: (){}, icon: const Icon(Icons.favorite_outline)),
        ],
      ),
      body: Column(
          children: [
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                       VxSwiper.builder(
                         autoPlay: true,
                           height: 350,
                           aspectRatio: 16/9,
                           itemCount: 3,
                           itemBuilder: (context,index){
                         return Image.asset(imgFc5, width: double.infinity,fit: BoxFit.cover);
                       }),
                        10.heightBox,
                        title!.text.size(16).color(darkFontGrey).fontFamily(semibold).make(),
                        // rating
                        10.heightBox,
                        VxRating(onRatingUpdate: (value){},
                          normalColor: textfieldGrey,selectionColor: golden,count: 5,size: 25,stepInt: true,
                        ),
                        10.heightBox,
                        "50000".text.color(redColor).fontFamily(semibold).size(18).make(),
                        10.heightBox,
                        Row(
                          children: [
                            Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                "Seller".text.white.fontFamily(semibold).make(),
                                5.heightBox,
                                "In House Brand".text.color(Colors.red).fontFamily(semibold).size(16).make(),
                              ],
                            )),
                             const CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Icon(Icons.message_rounded,color: darkFontGrey),
                            )
                          ],
                        ).box.height(50).color(darkFontGrey).make(),

                        Column(
                         children: [
                           Row(
                             children: [
                               SizedBox(
                                 width: 100,
                                 child: "Color".text.color(textfieldGrey).make(),
                               ),
                               Row(
                                 children: List.generate(3,
                                         (index) => VxBox().size(40, 40).roundedFull.color(
                                             Vx.randomPrimaryColor).margin(
                                             const EdgeInsets.symmetric(horizontal: 6)).make()
                                 ),
                               ),
                             ],
                           ).box.padding(const EdgeInsets.all(8)).make(),
                     // Quantity Row
                           Row(
                             children: [
                               SizedBox(
                                 width: 100,
                                 child: "Quantity".text.color(textfieldGrey).make(),
                               ),
                               Row(
                               children: [
                                 IconButton(onPressed: (){}, icon: const Icon(Icons.remove),),
                                 "0".text.size(16).fontFamily(bold).color(darkFontGrey).make(),
                                 IconButton(onPressed: (){}, icon: const Icon(Icons.add),),
                                 "(0 available)".text.color(textfieldGrey).make(),
                               ],
                               ),
                             ],
                           ).box.padding(const EdgeInsets.all(8)).make(),
                           //Total Rows
                           Row(
                             children: [
                               SizedBox(
                                 width: 100,
                                 child: "Total".text.color(textfieldGrey).make(),
                               ),
                               "0.00".text.color(redColor).size(16).fontFamily(bold).make(),
                             ],
                           ).box.padding(const EdgeInsets.all(8)).make(),
                         ],
                        ).box.white.shadowSm.make(),

                        10.heightBox,
                        //Description Starts here
                        "Description".text.color(darkFontGrey).fontFamily(semibold).make(),
                        "This is Dummy items and Dummy Description".text.color(textfieldGrey).fontFamily(semibold).make(),

                        //buttons List
                        10.heightBox,
                        ListView(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          children: List.generate(itemsDetailsButtonList.length, (index) => ListTile(
                            title: itemsDetailsButtonList[index].text.fontFamily(bold).color(darkFontGrey).make(),
                            trailing: const Icon(Icons.arrow_forward),
                          ))
                        ),
                        20.heightBox,
                        //Product likes...
                        productyoumaylike.text.color(darkFontGrey).size(16).fontFamily(bold).make(),
                        10.heightBox,
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(
                              6,
                                  (index) =>
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(imgP1, width: 120, fit: BoxFit.cover),
                                      10.heightBox,
                                      "Laptop 4GB/64GB".text.fontFamily(semibold).color(darkFontGrey).make(),
                                      10.heightBox,
                                      "Tsh 700000".text.fontFamily(bold).color(redColor).size(18).make(),

                                    ],
                                  ).box.white.margin(const EdgeInsets.symmetric(horizontal: 4)).roundedSM.padding(const EdgeInsets.all(8)).make(),
                            ),

                          ),
                        ),

                      ],
                    ),
                  ),
                ),
            ),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: sharedButton(
                color: redColor,
                onPress: (){},
                  textColor: whiteColor,title: "add to cart",
              ),
            )
          ],
      ),
    );
  }
}
