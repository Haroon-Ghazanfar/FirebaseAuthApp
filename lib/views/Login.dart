// ignore_for_file: sized_box_for_whitespace

import 'package:firebase/views/ForgetPassword.dart';
import 'package:firebase/views/SignUp.dart';
import 'package:firebase/views/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController loginEmailcontroller = TextEditingController();
  TextEditingController loginpasswordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text(
            "Login",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue.shade900),
      body: SingleChildScrollView(
        // ignore: sized_box_for_whitespace
        child: Column(
          children: [
            Container(
              height: 300,
              width: MediaQuery.of(context).size.width,
              child: Lottie.asset("assets/animation_lmypi17t.json"),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextFormField(
                controller: loginEmailcontroller,
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
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextFormField(
                controller: loginpasswordcontroller,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.password_rounded),
                  suffixIcon: Icon(Icons.visibility),
                  hintText: 'Password',
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
            ElevatedButton(
              onPressed: () async {
                var loginemail = loginEmailcontroller.text.trim();
                var loginpassword = loginpasswordcontroller.text.trim();

                try {
                  final User? firebaseUser = (await FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                              email: loginemail, password: loginpassword))
                      .user;
                  if (firebaseUser != Null) {
                    Get.to(Home());
                  } else {
                    print("Invalid Email or Password");
                  }
                } on FirebaseAuthException catch (e) {
                  print("Error$e");
                }
              },
              child: const Text("Login"),
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: () {
                Get.to(Forget_Password());
              },
              child: Text("Forgot Password??"),
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: () {
                Get.to(SignUp());
              },
              child: Text("Don't have an Account? SignUp"),
            )
          ],
        ),
      ),
    );
  }
}
