import 'dart:async';
import 'dart:ffi';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/databases/firebase.dart';
import 'package:whatsapp/pages/choosingpage.dart';
import 'package:whatsapp/pages/home_page.dart';

class Verification extends StatefulWidget {
  const Verification({super.key});

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  var user = FirebaseAuth.instance.currentUser;
  Timer? timer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        user.sendEmailVerification();
      }
    });
    timer = Timer.periodic(Duration(seconds: 5), (timer) {
      emailverified();
    });
  }

  @override
  void dispose() {
    timer!.cancel();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text(
        'verifing Email ...',
      ),
    ));
  }

  Future<void> emailverified() async {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        user.reload();
        if (user.emailVerified) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Choosingpage(),
              ));
          timer!.cancel();
        }
      }
    });
  }
}
