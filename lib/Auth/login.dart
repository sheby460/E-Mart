import 'package:emart_app/Auth/signup.dart';
import 'package:emart_app/common_widget/applogo_widget.dart';
import 'package:emart_app/common_widget/bg_widget.dart';
import 'package:emart_app/common_widget/costum_text_filed.dart';
import 'package:emart_app/common_widget/shared_button.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/controller/auth_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../consts/socials.dart';
import '../view/home_screen/home.dart';
import '../view/home_screen/home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());
    return bgWidget(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Column(
            children: [
              (context.screenHeight * 0.1).heightBox,
              appLogoWidget(),
              10.heightBox,
              "Log in to $appname".text.fontFamily(bold).white.size(18).make(),
              20.heightBox,

              Obx(
                      () =>Column(
                 children: [
                  customTextField(hint: emailHint, title: email,isPass: false,controller: controller.emailController),
                  customTextField(hint: passwordHint, title: password,isPass: true,controller: controller.passwordController),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(onPressed: (){},
                      child: forgotPass.text.make(),),
                  ),
                  5.heightBox,
                   controller.isLoading.value ? const CircularProgressIndicator(
                     valueColor: AlwaysStoppedAnimation(redColor),
                   )
                   :sharedButton(color: redColor,title: login,textColor: whiteColor,
                       onPress: () async{
                     controller.isLoading(true);
                     await controller.loginMethod(context: context).then((value) {
                       if(value != null){
                         VxToast.show(context, msg: loggedIn);
                         Get.offAll(()=> const Home());
                       }else{
                         controller.isLoading(false);
                       }
                     });
                   }).box.width(context.screenWidth -50).make(),
                  
                   5.heightBox,
                    createNewAccount.text.color(fontGrey).make(),

                  5.heightBox,
                  sharedButton(color: lightGolden,title: signup,textColor: redColor,onPress: (){
                    Get.to(()=> const SignUpScreen());
                  }).box.width(context.screenWidth -50).make(),
                  10.heightBox,
                  loginwith.text.color(fontGrey).make(),
                  5.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                        3, (index) => CircleAvatar(
                        backgroundColor: lightGrey,
                        radius: 25,
                      child: Image.asset(socialIconList[index],
                      width: 30,
                      ),
                    )),
                  ),
                ],
              )).box.white.rounded.padding(const EdgeInsets.all(16)).width(context.screenWidth - 70).shadowSm.make(),

            ],
          ),
        ),
      )
    );
  }
}
