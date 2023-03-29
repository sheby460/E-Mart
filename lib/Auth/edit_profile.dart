import 'dart:io';

import 'package:emart_app/common_widget/bg_widget.dart';
import 'package:emart_app/common_widget/shared_button.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/controller/profile_controller.dart';
import 'package:get/get.dart';
import '../common_widget/costum_text_filed.dart';
import '../consts/images.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller =Get.find<ProfileEditController>();
    return bgWidget(
        child: Scaffold(
      appBar: AppBar(),
      body: Obx(()
          => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          controller.profileImgPath.isEmpty ? Image.asset(
            imgProfile2,
            width: 100,
            fit: BoxFit.cover,
          ).box.rounded.clip(Clip.antiAlias).make(): Image.file(File(controller.profileImgPath.value),
          ),
          10.heightBox,
          sharedButton(
              color: redColor,
              onPress: () {
               controller.changeImage(context);
              },
              textColor: whiteColor,
              title: "Change"),
          const Divider(),
          20.heightBox,
          customTextField(hint: nameHint, title: name, isPass: false),
          customTextField(hint: passwordHint, title: password, isPass: true),
          20.heightBox,
          SizedBox(
            child: sharedButton(
                onPress: () {
                },
                color: redColor,
                textColor: whiteColor,
                title: "save"),
          )
        ],
      )
          .box
          .white
          .shadowSm
          .padding(const EdgeInsets.all(16))
          .margin(const EdgeInsets.only(top: 50, left: 12, right: 12))
          .rounded
          .make(),
    )));
  }
}
