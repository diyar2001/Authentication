import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/widgets/textfield.dart';
import 'package:whatsapp/databases/firebase.dart';
import 'verification.dart';
import 'signin.dart';

class Signup extends StatefulWidget {
  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  var user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 60,
            ),
            Text(
              'Sign Up',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 40,
            ),
            textfield('Email', email)!,
            SizedBox(
              height: 10,
            ),
            textfield('Password', password)!,
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: MaterialButton(
                onPressed: () async {
                  print(email.text.trim());
                  Firebasedb.signup(
                      email.text.trim().toString(), password.text.trim().toString(), context);
                  Firebasedb.signin(
                      email.text.trim().toString(), password.text.trim().toString(), context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Verification(),
                      ));
                },
                child: Text(
                  'Sign up',
                  style: TextStyle(fontSize: 22),
                ),
                color: Colors.red,
                textColor: Colors.white,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              children: [
                Text('Already you have account'),
                SizedBox(
                  width: 10,
                ),
                TextButton(
                    onPressed: (() => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Signin()))),
                    child: Text(
                      'click here',
                      style: TextStyle(color: Colors.blue),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
