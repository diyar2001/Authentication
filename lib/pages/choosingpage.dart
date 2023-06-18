import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/pages/signin.dart';
import 'home_page.dart';

class Choosingpage extends StatefulWidget {

  @override
  State<Choosingpage> createState() => _ChoosingpageState();
}

class _ChoosingpageState extends State<Choosingpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Homepage();
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.data == null) {
            return Signin();
          } else {
            return Text('Error ');
          }
        },
      ),
    );
  }
}
