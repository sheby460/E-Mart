import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController{
  var isLoading = false.obs;

//textController
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  //Login info here
  Future <UserCredential?> loginMethod({context}) async{
    UserCredential? userCredentials;

    try {
      userCredentials = await auth.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text);
    } on FirebaseAuthException catch(e){
      VxToast.show(context, msg: e.toString());
    }
    return userCredentials;
  }

  //Register user
  Future <UserCredential?> signUpMethod({email, password, context}) async{
    UserCredential? userCredentials;

    try {
      userCredentials = await auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch(e){
      VxToast.show(context, msg: e.toString());
    }
    return userCredentials;
  }

  //storing data Method
  storeUserData({required String email, required String password, required String name, }) async{
    DocumentReference store = firestore.collection(usersCollection).doc(currentUser?.uid);
    store.set({
      "name": name,
      "email": email,
      "password": password,
      "imageUrl": '',
      "id": currentUser?.uid,
      "cart_count": "00",
       "order_count": "00",
      "wishlits_count": "00"
    });
 }

 //Logout
signOutMethod(context) async{
    try{
      await auth.signOut();
    }catch(e){
      VxToast.show(context, msg: e.toString());
    }
}
//Editing User Profile
editProfileMethod() async{

}
}