import 'package:firebase/views/Login.dart';
import 'package:firebase/views/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class Forget_Password extends StatefulWidget {
  const Forget_Password({super.key});

  @override
  State<Forget_Password> createState() => _Forget_PasswordState();
}

class _Forget_PasswordState extends State<Forget_Password> {
  TextEditingController forget_password_controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Forget Password",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue.shade900),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: MediaQuery.of(context).size.width,
              child: Lottie.asset("assets/animation_lmyut5j8.json"),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextFormField(
                controller: forget_password_controller,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email_outlined),
                  hintText: 'Email',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.blue),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () async {
                var forgetEmail = forget_password_controller.text.trim();

                try {
                  FirebaseAuth.instance
                      .sendPasswordResetEmail(email: forgetEmail)
                      .then((value) => {print("Email Sent"), Get.off(Login())});
                } on FirebaseAuthException catch (e) {
                  print("Error $e");
                }
              },
              child: const Text("Reset Password"),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
