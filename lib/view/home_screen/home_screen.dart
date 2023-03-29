import 'package:emart_app/common_widget/home_button.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:flutter/material.dart';

import '../../common_widget/features_button.dart';
import '../../consts/list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      color: lightGrey,
      width: context.screenWidth,
      height: context.screenHeight,
        child: SafeArea(
          child: Expanded(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 60,
                  color: lightGrey,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      suffixIcon: Icon(Icons.search),
                      filled: true,
                      fillColor: whiteColor,
                      hintText: search,
                      hintStyle: TextStyle(color: redColor),
                    ),
                  ),
                ),
            10.heightBox,
                Expanded(
                  child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child:  Column(
                  children: [
                    //Swiper Start Here..
                    VxSwiper.builder(
                        aspectRatio: 16/9,
                        autoPlay: true,
                        height: 100,
                        enlargeCenterPage: true,
                        itemCount: sliderList.length, itemBuilder: (context,index){
                      return  Image.asset(
                        sliderList[index],
                        fit: BoxFit.fitWidth,
                      ).box.rounded.clip(Clip.antiAlias).margin(const EdgeInsets.symmetric(horizontal: 8)).make();
                    }),
                    10.heightBox,
                    //Deals buttons
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(2, (index) => homeButton(
                          height: context.screenHeight * 0.15,
                          width: context.screenWidth / 2.5,
                          icon: index == 0 ? icTodaysDeal: icFlashDeal,
                          tittle: index == 0 ? toDayDeal :flashSales,
                        ))
                    ),
                    //second swiper
                    10.heightBox,
                    VxSwiper.builder(
                        aspectRatio: 16/9,
                        autoPlay: true,
                        height: 100,
                        enlargeCenterPage: true,
                        itemCount: sliderList2.length, itemBuilder: (context,index){
                      return  Image.asset(
                        sliderList2[index],
                        fit: BoxFit.fitWidth,
                      ).box.rounded.clip(Clip.antiAlias).margin(const EdgeInsets.symmetric(horizontal: 8)).make();
                    }),
                    10.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(3, (index) => homeButton(
                        height: context.screenHeight * 0.15,
                        width: context.screenWidth / 4,
                        icon: index == 0 ? icTopCategories :index == 1 ? icBrands: icTopSeller,
                        tittle: index == 0 ? topCategory :index == 1 ? brand : topSeller,
                      ),),
                    ),
                    10.heightBox,
                    Align(
                      alignment: Alignment.centerLeft,
                      child: feature.text.color(darkFontGrey).size(12).fontFamily(semibold).make(),
                    ),

                  20.heightBox,
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child:   Row(
                      children: List.generate(3, (index) => Column(
                        children: [
                          featureButton(icon: featuredImageList1[index], title: featuredTittle1[index]),
                          10.heightBox,
                          featureButton(icon: featuredImageList2[index], title: featuredTittle2[index]),
                        ],
                      ),
                      ).toList(),
                    ),
                  ),
                    //Featured product start here.......
                    10.heightBox,
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: const BoxDecoration(color: redColor),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          featuredProduct.text.white.fontFamily(bold).size(12).make(),
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
                                  Image.asset(imgP1, width: 100, fit: BoxFit.cover),
                                  10.heightBox,
                                  "Laptop 4GB/64GB".text.fontFamily(semibold).color(darkFontGrey).make(),
                                  10.heightBox,
                                  "Tsh 700000".text.fontFamily(bold).color(redColor).size(12).make(),

                                ],
                              ).box.white.margin(const EdgeInsets.symmetric(horizontal: 4)).roundedSM.padding(const EdgeInsets.all(8)).make(),
                              ),

                            ),
                          ),
                        ],
                      ),
                    ),

                    //3rd Swiper
                    20.heightBox,
                    VxSwiper.builder(
                        aspectRatio: 16/9,
                        autoPlay: true,
                        height: 100,
                        enlargeCenterPage: true,
                        itemCount: sliderList2.length, itemBuilder: (context,index){
                      return  Image.asset(
                        sliderList2[index],
                        fit: BoxFit.fitWidth,
                      ).box.rounded.clip(Clip.antiAlias).margin(const EdgeInsets.symmetric(horizontal: 8)).make();
                    }),
                    
                    //All Product Sections Start here
                    GridView.builder(
                        shrinkWrap: true,
                        itemCount: 6,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, mainAxisSpacing: 8, crossAxisSpacing: 8, mainAxisExtent: 300
                        ),
                        itemBuilder: (context,index){
                      return   Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                              imgP5,
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover
                          ),
                          const Spacer(),
                          "Laptop 4GB/64GB".text.fontFamily(semibold).color(darkFontGrey).make(),
                          10.heightBox,
                          "Tsh 700000".text.fontFamily(bold).color(redColor).size(12).make(),

                        ],
                      ).box.white.margin(const EdgeInsets.symmetric(horizontal: 4)).roundedSM.padding(const EdgeInsets.all(8)).make();
                    }),
                  ],
                ),
                ),
                ),
              ],
            )
          )),
    );
  }
}
