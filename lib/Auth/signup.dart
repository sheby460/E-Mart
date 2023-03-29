import 'package:emart_app/Auth/login.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/controller/auth_controller.dart';
import 'package:emart_app/view/home_screen/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../common_widget/applogo_widget.dart';
import '../common_widget/bg_widget.dart';
import '../common_widget/costum_text_filed.dart';
import '../common_widget/shared_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
   bool? isChecked = false;
   var controller = Get.put(AuthController());

   var nameController = TextEditingController();
   var emailController = TextEditingController();
   var passwordController = TextEditingController();
   var retypePasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return bgWidget(
        child: Scaffold(
          body: Center(
            child: Column(
              children: [
                (context.screenHeight * 0.1).heightBox,
                appLogoWidget(),
                10.heightBox,
                "Sign up to $appname".text.fontFamily(bold).white.size(18).make(),
                10.heightBox,
              Obx(()
              =>Column(
                  children: [
                    customTextField(hint: nameHint, title: name,controller: nameController,isPass: false),
                    customTextField(hint: emailHint, title: email,controller: emailController,isPass: false),
                    customTextField(hint: passwordHint, title: password, controller: passwordController,isPass: true),
                    customTextField(hint: retypePasswordHint, title: retypePassword, controller: retypePasswordController,isPass: true),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(onPressed: (){},
                        child: forgotPass.text.make(),),
                    ),

                    5.heightBox,
                    haveAccount.text.color(fontGrey).make(),

                    5.heightBox,

                    Row(
                      children: [
                        Checkbox(
                            checkColor: redColor,
                            value: isChecked,
                            onChanged: (newValue){
                              setState(() {
                                isChecked = newValue;
                              });
                            }
                        ),
                        10.heightBox,
                        Expanded(
                          child:RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: "I agree to the ",
                                  style: TextStyle(
                                    fontFamily: regular,
                                    color: fontGrey,
                                  ),
                                ),
                                TextSpan(
                                  text: terms,
                                  style: TextStyle(
                                    fontFamily: regular,
                                    color: redColor,
                                  ),
                                ),
                                TextSpan(
                                  text: " & ",
                                  style: TextStyle(
                                    fontFamily: regular,
                                    color: redColor,
                                  ),
                                ),
                                TextSpan(
                                  text: privacy,
                                  style: TextStyle(
                                    fontFamily: regular,
                                    color: redColor,
                                  ),
                                )
                              ],
                            ),

                          ),
                        ),
                      ],
                    ),
                    5.heightBox,
                    controller.isLoading.value ? const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(redColor),
                    )
                        :sharedButton(color: isChecked == true ? redColor:lightGrey,title: signup,textColor: whiteColor,onPress: () async{
                      if(isChecked != false){
                        controller.isLoading(true);
                        try{
                          await controller.signUpMethod(context: context, email: emailController.text,
                              password: passwordController.text).then((value) {
                                return controller.storeUserData(
                                  email: emailController.text,
                                  password: passwordController.text,
                                  name: nameController.text,
                                );
                          }).then((value) {
                            VxToast.show(context, msg: loggedIn);
                            Get.offAll(() => const Home());
                          });
                        }catch(e){
                         auth.signOut();
                         VxToast.show(context, msg: e.toString());
                        }
                      }else{
                        controller.isLoading(false);
                      }
                    },
                    ).box.width(context.screenWidth -50).make(),
                    10.heightBox,
                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: haveAccount,
                            style: TextStyle(fontFamily: bold, color: fontGrey),
                          ),
                          TextSpan(
                            text: login,
                            style: TextStyle(fontFamily: bold, color: redColor),
                          ),
                        ],
                      ),
                    ).onTap(() {
                      Get.back();
                    })
                  ],
                ).box.white.rounded.padding(const EdgeInsets.all(16)).width(context.screenWidth - 70).shadowSm.make()
              )
              ],
            ),
          ),
        )
    );
  }
}
