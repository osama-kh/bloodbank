import 'package:bloodbank/Blood_donation.dart';
import 'package:bloodbank/Drawer_main.dart';
import 'package:bloodbank/Sign_in.dart';
import 'package:bloodbank/add_user.dart';
import 'package:bloodbank/audit_log.dart';
import 'package:bloodbank/audit_log_viewer.dart';
import 'package:bloodbank/surgery_and_trauma.dart';
import 'package:bloodbank/userPage.dart';
import 'package:date_field/date_field.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'Emergency.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter Demo', home: Sign_in(), routes: {
      'Donation list': (context) => Blood_donation(),
      "Surgrey and trauma": (context) => Surgery_and_trauma(),
      "Emergency": (context) => Emergency(),
      "Audit log": (context) => audit_log_viewer(),
      "userPage": (context) => UserPage(),
      "add_User": (context) => add_User(),
    });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer_main(context),
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text(
            "Blood bank",
            style: TextStyle(fontSize: 19),
          ),
        ),
        body: Text("main"));
  }
}
