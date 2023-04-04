import 'package:emart_app/consts/consts.dart';

class FireStoreServices {
  //Getting user data

  static getUser(uid) {
    return firestore
        .collection(usersCollection)
        .where("id", isEqualTo: uid)
        .snapshots();
  }
}
