import 'package:bloodbank/Drawer_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Admin extends StatefulWidget {
  final dataOfUser;
  const Admin(this.dataOfUser);

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: Drawer_main(context),
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          "Blood bank",
          style: TextStyle(fontSize: 19),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(8),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.3,
            color: Colors.amberAccent,
            child: Text(
              "Welcome, Admin",
              style: TextStyle(fontSize: 25),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.black12,
                border: Border.symmetric(horizontal: BorderSide())),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.15,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'add_User');
                      },
                      child: Text(
                        "add new user",
                        style: TextStyle(color: Colors.red, fontSize: 18),
                      )),
                  Text("other operations in the drawer "),
                  Text(
                    "<--",
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
