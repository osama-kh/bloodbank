import 'package:flutter/material.dart';


class User_by_admin extends StatefulWidget {
    final dataOfUser;

  const User_by_admin(this.dataOfUser);

  @override
  State<User_by_admin> createState() => _UserState();
}

class _UserState extends State<User_by_admin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Text("User_by_admin"),);
  }
}