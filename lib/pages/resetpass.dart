import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/pages/choosingpage.dart';
import 'package:whatsapp/widgets/textfield.dart';
import 'package:whatsapp/databases/firebase.dart';
import 'verification.dart';
import 'signin.dart';

class Resetpassword extends StatefulWidget {
  @override
  State<Resetpassword> createState() => _ResetpasswordState();
}

class _ResetpasswordState extends State<Resetpassword> {
    final key = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
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
            Row(
              children: [
                IconButton(
                    onPressed: (() => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Choosingpage(),
                        ))),
                    icon: Icon(Icons.arrow_back)),
                Text(
                  'Reset Password',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            textfield('Email', email)!,
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
                  Firebasedb.resetpass(email.text.trim().toString());
                },
                child: Text(
                  'Reset password',
                  style: TextStyle(fontSize: 22),
                ),
                color: Colors.green,
                textColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
