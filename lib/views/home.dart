import 'package:flutter/material.dart';
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
          ],
        ),
      ),
    );
  }
}
