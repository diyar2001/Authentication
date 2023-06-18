import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Firebasedb {
  static UserCredential? usercredintial;
  static var user = FirebaseAuth.instance.currentUser;

  static void signinanonymus() async {
    final user = await FirebaseAuth.instance.signInAnonymously();
  }

  static void signin(
      String email, String password, BuildContext context) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Logged in'))));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('No user found for that email.')));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Wrong password provided for that user.')));
      }
    }
  }

  static void signout() async {
    final user = FirebaseAuth.instance.signOut();
  }

  static void signup(String email, String pass, BuildContext context) async {
    try {
      usercredintial = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: pass)
          .then((value) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('User created')));
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('The password provided is too weak.')));
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('The account already exists for that email.')));
      }
    } catch (e) {
      print(e);
    }
  }

  static Future<void> resetpass(String email) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }
}
