import 'package:firebase/views/Login.dart';
import 'package:firebase/views/notes_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          "Authentication App",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        child: Column(
          children: [
            Center(
              child: Text(
                'Welcome to Home Page',
                style: TextStyle(
                  fontSize: 34,
                ),
              ),
            ),
            Container(
              height: 300,
              width: MediaQuery.of(context).size.width,
              child: Lottie.asset("assets/animation_ln1m1rf4.json"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Logout"),
                SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    FirebaseAuth.instance.signOut();
                    Get.off(Login());
                  },
                  child: Icon(Icons.logout),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 40,
              width: 100,
              child: FloatingActionButton(
                onPressed: () {
                  Get.to(Notes());
                },
                child: Text("Add Notes"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
