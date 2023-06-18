import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'pages/signin.dart';
import 'pages/signup.dart';
import 'pages/choosingpage.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      /*theme: ThemeData.light().copyWith(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Colors.red),
      ),*/
      home: Choosingpage(),
    );
  }
}




/*
class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController account = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 236, 100, 91),
        body: Stack(children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: ListView(
              shrinkWrap: true,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height / 10),
                Icon(
                  Icons.diamond,
                  color: Colors.white,
                  size: 150,
                ),
                SizedBox(height: 50),
                TextField(
                  controller: account,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(25)),
                    contentPadding: EdgeInsets.all(10),
                    hintText: 'User@gmail.com',
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: password,
                  obscureText: true,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(25)),
                      contentPadding: EdgeInsets.all(10),
                      hintText: 'Password',
                      prefixIcon: Icon(Icons.visibility)),
                ),
                SizedBox(height: 35),
                MaterialButton(
                  onPressed: (() => print('object')),
                  child: Text(
                    'Sign in',
                    style: TextStyle(fontSize: 24),
                  ),
                  color: Color.fromRGBO(0, 0, 0, 0.3),
                  textColor: Colors.white,
                  elevation: 1,
                  height: 50,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                ),
                SizedBox(height: 8),
                TextButton(
                    onPressed: (() => print('')),
                    child: Text(
                      'Forgot passwor?',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ))
              ],
            ),
          )
        ]));
  }
}
*/
