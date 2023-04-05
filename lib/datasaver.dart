import 'package:flutter/material.dart';

class datasaver {
  _datasaver() {
    // TODO: implement _datasaver
    throw UnimplementedError();
  }

  static datasaver _app = datasaver();
  var Oplus = 0,
      Aplus = 0,
      Bplus = 0,
      ABplus = 0,
      Ominus = 0,
      Aminus = 0,
      Bminus = 0,
      ABminus = 0,
      counter = 0;

  List<String> Blood_types = ["O+", "A+", "B+", "AB+", "O-", "A-", "B-", "AB-"];
  List<TableRow> blood_statistics = [
    TableRow(children: [
      Container(
          height: 40,
          alignment: Alignment.center,
          child: Text("O+", style: TextStyle(fontSize: 18))),
      Container(
          height: 40,
          alignment: Alignment.center,
          child: Text("A+", style: TextStyle(fontSize: 18))),
      Container(
          height: 40,
          alignment: Alignment.center,
          child: Text("B+", style: TextStyle(fontSize: 18))),
      Container(
          height: 40,
          alignment: Alignment.center,
          child: Text("AB+", style: TextStyle(fontSize: 18))),
      Container(
          height: 40,
          alignment: Alignment.center,
          child: Text("O-", style: TextStyle(fontSize: 18))),
      Container(
          height: 40,
          alignment: Alignment.center,
          child: Text("A-", style: TextStyle(fontSize: 18))),
      Container(
          height: 40,
          alignment: Alignment.center,
          child: Text("B-", style: TextStyle(fontSize: 18))),
      Container(
          height: 40,
          alignment: Alignment.center,
          child: Text("AB-", style: TextStyle(fontSize: 18)))
    ], decoration: BoxDecoration(color: Colors.black12)),
    TableRow(children: [
      Container(
          height: 40,
          alignment: Alignment.center,
          child: Text("-", style: TextStyle(fontSize: 18))),
      Container(
          height: 40,
          alignment: Alignment.center,
          child: Text("-", style: TextStyle(fontSize: 18))),
      Container(
          height: 40,
          alignment: Alignment.center,
          child: Text("-", style: TextStyle(fontSize: 18))),
      Container(
          height: 40,
          alignment: Alignment.center,
          child: Text("-", style: TextStyle(fontSize: 18))),
      Container(
          height: 40,
          alignment: Alignment.center,
          child: Text("-", style: TextStyle(fontSize: 18))),
      Container(
          height: 40,
          alignment: Alignment.center,
          child: Text("-", style: TextStyle(fontSize: 18))),
      Container(
          height: 40,
          alignment: Alignment.center,
          child: Text("-", style: TextStyle(fontSize: 18))),
      Container(
          height: 40,
          alignment: Alignment.center,
          child: Text("-", style: TextStyle(fontSize: 18)))
    ], decoration: BoxDecoration(color: Colors.black12)),
  ];

  List<TableRow> rows = [
    TableRow(children: [
      Container(
          height: 40,
          alignment: Alignment.center,
          child: Text("Full name", style: TextStyle(fontSize: 18))),
      Container(
          height: 40,
          alignment: Alignment.center,
          child: Text("Id", style: TextStyle(fontSize: 18))),
      Container(
          height: 40,
          alignment: Alignment.center,
          child: Text("Date", style: TextStyle(fontSize: 18))),
      Container(
          height: 40,
          alignment: Alignment.center,
          child: Text("Blood type", style: TextStyle(fontSize: 18)))
    ], decoration: BoxDecoration(color: Colors.black12)),
  ];

  static datasaver datasaverapp() {
    return _app;
  }
}
