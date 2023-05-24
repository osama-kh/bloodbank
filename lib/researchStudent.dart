import 'package:flutter/material.dart';

class researchStudent extends StatefulWidget {
  final dataOfUser;

  const researchStudent(this.dataOfUser);

  @override
  State<researchStudent> createState() => _researchStudentState();
}

class _researchStudentState extends State<researchStudent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("researchStudent"),
    );
  }
}
