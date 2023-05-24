import 'dart:io';
import 'dart:math';
//--no-sound-null-safety
import 'package:bloodbank/Admin.dart';
import 'package:bloodbank/researchStudent.dart';
import 'package:bloodbank/User_by_admin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

final _firestore = FirebaseFirestore.instance;
final _auth = FirebaseAuth.instance;
var dataOfUser;
var loggedInUser;
bool showSpinner = false;

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    dataOfUser = {
      "Fullname": "unknown",
      "phoneNumber": "unknown",
      "typeUser": "unknown"
    };
    try {
      setState(() {
        showSpinner = true;
      });
      User? user = await _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);

        final events = await _firestore
            .collection('userData')
            .doc(loggedInUser.email)
            .get();
        if (events != null) {
          dataOfUser = events.data();

          dataOfUser['Email'] = events.id;
          print(
              "dataof users ---------------------------------------------------------");
          print(dataOfUser.toString());
          setState(() {
            showSpinner = false;
          });
        }
      }
    } catch (e) {
      setState(() {
        showSpinner = false;
      });
      print(e);
    }
  }

  // title: Text(dataOfUser['Fullname'].toString()),

  @override
  Widget build(BuildContext context) {
    final typeUser = ModalRoute.of(context)?.settings.arguments;
    if (dataOfUser['typeUser'].toString() == 'Admin') {
      return ModalProgressHUD(
          inAsyncCall: showSpinner, child: Admin(dataOfUser));
    } else if (dataOfUser['typeUser'] == 'User') {
      print("current user");
      print(dataOfUser);
      print("current user");

      return ModalProgressHUD(
          inAsyncCall: showSpinner, child: User_by_admin(dataOfUser));
    } else if (dataOfUser['typeUser'] == 'ResearchStudent') {
      print("current user");
      print(dataOfUser);
      print("current user");

      return ModalProgressHUD(
          inAsyncCall: showSpinner, child: researchStudent(dataOfUser));
    } else {
      return Text("Error! no User found");
    }
  }
}
