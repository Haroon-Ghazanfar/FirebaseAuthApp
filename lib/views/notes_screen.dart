import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Notes extends StatefulWidget {
  const Notes({super.key});

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  TextEditingController notescontroller = TextEditingController();
  User? userId = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notes",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            TextFormField(
              controller: notescontroller,
              decoration: InputDecoration(hintText: "Add Notes Here"),
              maxLines: null,
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                var notes = notescontroller.text.trim();
                if (notes != null) {
                  try {
                    FirebaseFirestore.instance.collection("Notes").doc().set({
                      "createdAt": DateTime.now(),
                      "note": notes,
                      "user ID": userId?.uid
                    });
                  } catch (e) {
                    print("Error $e");
                  }
                }
              },
              child: Text("Add Note"),
            )
          ],
        ),
      ),
    );
  }
}
