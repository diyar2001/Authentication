import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/pages/signup.dart';
import 'package:whatsapp/widgets/textfield.dart';
import 'package:whatsapp/databases/firebase.dart';
import 'package:whatsapp/databases/firebase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'resetpass.dart';

class Signin extends StatefulWidget {
  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

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
              'Welcome',
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
            Container(
                alignment: Alignment.topLeft,
                child: Row(
                  children: [
                    Text(
                      'Forgot your password?',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    TextButton(
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => Resetpassword()))),
                        child: Text(
                          'click here',
                          style: TextStyle(color: Colors.blue),
                        ))
                  ],
                )),
            SizedBox(
              height: 25,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: MaterialButton(
                onPressed: (() async => Firebasedb.signin(
                    email.text.trim().toString(),
                    password.text.trim().toString(),
                    context)),
                child: Text(
                  'Log in',
                  style: TextStyle(fontSize: 22),
                ),
                color: Colors.red,
                textColor: Colors.white,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'OR',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: MaterialButton(
                onPressed: (() async => Firebasedb.signinanonymus()),
                child: ListTile(
                  horizontalTitleGap: 70,
                  leading: Icon(
                    Icons.no_accounts,
                    color: Colors.white,
                    size: 35,
                  ),
                  title: Text(
                    'Anonymous',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                color: Color.fromARGB(255, 81, 153, 212),
                textColor: Colors.white,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              children: [
                Text(
                  "You haven't account",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 5,
                ),
                TextButton(
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: ((context) => Signup()))),
                    child: Text(
                      'register now',
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
