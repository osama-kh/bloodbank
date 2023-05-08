import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';

class Drawer_main extends StatelessWidget {
  final context;
  const Drawer_main(this.context);

  @override
  Widget build(context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            decoration: BoxDecoration(
                color: Colors.black12,
                border: Border(bottom: BorderSide(style: BorderStyle.none))),
            child: CircleAvatar(
                radius: MediaQuery.of(context).size.height * 0.3,
                backgroundImage: AssetImage("assets/blood_bank.png")),
          ),
          ListTile(
            leading: Icon(Icons.bloodtype),
            title: Text('Donation list'),
            onTap: () {
              Navigator.pushNamed(context, 'Donation list');
            },
          ),
          ListTile(
            leading: Icon(Icons.local_hospital),
            title: Text('Surgery and trauma'),
            onTap: () {
              Navigator.pushNamed(context, 'Surgrey and trauma');
            },
          ),
          ListTile(
            leading: Icon(Icons.emergency),
            title: Text('Emergency'),
            onTap: () {
              Navigator.pushNamed(context, 'Emergency');
            },
          ),
          ListTile(
            leading: Icon(Icons.text_snippet_outlined),
            title: Text('Audit log'),
            onTap: () {
              Navigator.pushNamed(context, 'Audit log');
            },
          ),
        ],
      ),
    );
  }
}
