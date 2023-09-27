import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/views/Login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

signUpUser(
  String username,
  String useremail,
  String userphone,
  String userpassword,
) async {
  User? userid = FirebaseAuth.instance.currentUser;

  try {
    await FirebaseFirestore.instance.collection("users").doc(userid?.uid).set({
      'name': username,
      'email': useremail,
      'phone': userphone,
    }).then((value) => {
          FirebaseAuth.instance.signOut(),
          Get.to(Login()),
        });
  } on FirebaseAuthException catch (e) {
    print("Error $e");
  }
}
