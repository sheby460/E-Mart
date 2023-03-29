import 'package:emart_app/Auth/edit_profile.dart';
import 'package:emart_app/Auth/login.dart';
import 'package:emart_app/common_widget/bg_widget.dart';
import 'package:emart_app/common_widget/card_details.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/consts/list.dart';
import 'package:emart_app/controller/auth_controller.dart';
import 'package:get/get.dart';

import '../controller/profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileEditController());

    return bgWidget(
        child: Scaffold(
          body: SafeArea(
              child: Column(
                children: [
                  //Edit user button
                     Padding(
                    padding: const EdgeInsets.all(8.0),
                  child: const Align(
                    alignment: Alignment.topRight,
                    child: Icon(Icons.edit,color: Colors.white)).onTap(() {
                    Get.to(()=> const EditProfileScreen());
                  }),
                 ),

                  //user details...
                   Padding(padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [

                      Image.asset(imgProfile2,width: 100, fit: BoxFit.cover,).box.rounded.clip(Clip.antiAlias).make(),

                      10.heightBox,
                      Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              "Dummy user".text.fontFamily(semibold).white.make(),
                              "user@gmail.com".text.fontFamily(bold).white.make(),
                            ],)
                      ),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(
                            color: Colors.white,
                          )
                        ),
                          onPressed: () async{
                             await Get.put(AuthController()).signOutMethod(context);
                             Get.offAll(()=> const LoginScreen());
                          },
                          child: "Logout".text.white.make(),
                      )
                    ],
                  ),
          ),
                  20.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      detailsCards(count: "00", title: "in your cart",width: context.screenWidth / 3.2),
                      detailsCards(count: "32", title: "in your wishlist",width: context.screenWidth / 3.2),
                      detailsCards(count: "675", title: "in your order",width: context.screenWidth / 3.2),
                    ],
                  ),
                  //Buttons section
                  ListView.separated(
                    shrinkWrap: true,
                  separatorBuilder: (context,index){
                    return const Divider(
                      color: lightGrey,
                    );
                  },
                    itemCount: profileButtonList.length,
                    itemBuilder: (BuildContext context, int index){
                    return  ListTile(
                      leading: Image.asset(profileButtonIcon[index],
                      width: 22,
                      ),
                      title: profileButtonList[index].text.fontFamily(semibold).color(darkFontGrey).make(),
                    );
                    },
                  ).box.white.rounded.margin(const EdgeInsets.all(12)).padding(const EdgeInsets.symmetric(horizontal: 16)).shadowSm.make().box.color(redColor).make(),
                ],
              )
          ),
        )
    );
  }
}

