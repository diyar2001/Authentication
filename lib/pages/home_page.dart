import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/databases/firebase.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('User ID: ${user?.uid}'),
          SizedBox(height: 15),
          MaterialButton(
            onPressed: (() async => Firebasedb.signout()),
            child: Text('Sign Out'),
            color: Colors.blue,
            textColor: Colors.white,
          )
        ],
      )),
    );
  }
}
