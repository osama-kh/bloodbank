import 'dart:developer';

import 'package:bloodbank/Drawer_main.dart';
import 'package:bloodbank/datasaver.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';

class Blood_donation extends StatefulWidget {
  const Blood_donation({super.key});

  @override
  State<Blood_donation> createState() => _Blood_donationState();
}

class _Blood_donationState extends State<Blood_donation> {
  var _Fullname;
  var _Bloodtype;
  var _Date;
  var _id;

  var Oplus = 0,
      Aplus = 0,
      Bplus = 0,
      ABplus = 0,
      Ominus = 0,
      Aminus = 0,
      Bminus = 0,
      ABminus = 0,
      counter = 0;

var data = datasaver.datasaverapp();

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

  void NewRow() {
    setState(() {
      rows.add(
        TableRow(
          children: [
            Text(_Fullname, style: TextStyle(fontSize: 16)),
            Text(_id, style: TextStyle(fontSize: 16)),
            Text(_Date.toString(), style: TextStyle(fontSize: 12)),
            Text(_Bloodtype, style: TextStyle(fontSize: 16))
          ],
          //decoration: BoxDecoration(color: Colors.black12),
        ),
      );
    });
  }

  String to_percent(var num) {
    double x = ((num / counter) * 100);
    return x.toStringAsFixed(1) + "%";
  }

  void add_donat_to_stat() {
    setState(() {
      if (_Bloodtype == "O+") {
        Oplus++;
      } else if (_Bloodtype == "A+") {
        Aplus++;
      } else if (_Bloodtype == "B+") {
        Bplus++;
      } else if (_Bloodtype == "AB+") {
        ABplus++;
      } else if (_Bloodtype == "O-") {
        Ominus++;
      } else if (_Bloodtype == "A-") {
        Aminus++;
      } else if (_Bloodtype == "B-") {
        Bminus++;
      } else if (_Bloodtype == "AB-") {
        ABminus++;
      }
      counter++;

      blood_statistics[1] = TableRow(children: [
        Container(
            height: 40,
            alignment: Alignment.center,
            child: Text(to_percent(Oplus), style: TextStyle(fontSize: 15))),
        Container(
            height: 40,
            alignment: Alignment.center,
            child: Text(to_percent(Aplus), style: TextStyle(fontSize: 15))),
        Container(
            height: 40,
            alignment: Alignment.center,
            child: Text(to_percent(Bplus), style: TextStyle(fontSize: 15))),
        Container(
            height: 40,
            alignment: Alignment.center,
            child: Text(to_percent(ABplus), style: TextStyle(fontSize: 15))),
        Container(
            height: 40,
            alignment: Alignment.center,
            child: Text(to_percent(Ominus), style: TextStyle(fontSize: 15))),
        Container(
            height: 40,
            alignment: Alignment.center,
            child: Text(to_percent(Aminus), style: TextStyle(fontSize: 15))),
        Container(
            height: 40,
            alignment: Alignment.center,
            child: Text(to_percent(Bminus), style: TextStyle(fontSize: 15))),
        Container(
            height: 40,
            alignment: Alignment.center,
            child: Text(to_percent(ABminus), style: TextStyle(fontSize: 15)))
      ], decoration: BoxDecoration(color: Colors.black12));
    });
  }

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
      body: Column(children: [
        Flexible(
          child: Container(
            color: Colors.amberAccent,
            height: MediaQuery.of(context).size.height * 0.5,
            child: Column(children: [
              Row(
                children: [
                  Text(
                    "Blood type: ",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: DropdownButtonFormField<String>(
                        autofocus: true,
                        value: _Bloodtype,
                        onChanged: (String? newValue) {
                          setState(() {
                            _Bloodtype = newValue;
                          });
                        },
                        items: Blood_types.map<DropdownMenuItem<String>>(
                            (String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(fontSize: 19),
                            ),
                          );
                        }).toList(),
                      )
                      //  TextField(
                      //   onChanged: (value) {
                      //     _Bloodtype = value;
                      //   },
                      //   decoration: InputDecoration(),
                      // ),
                      ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Date:            ",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: DateTimeFormField(
                      decoration: const InputDecoration(
                        hintStyle: TextStyle(color: Colors.black45),
                        errorStyle: TextStyle(color: Colors.redAccent),
                        suffixIcon: Icon(Icons.event_note),
                        labelText: 'Date',
                      ),
                      mode: DateTimeFieldPickerMode.dateAndTime,
                      autovalidateMode: AutovalidateMode.always,
                      validator: (e) => (e?.day ?? 0) == 1
                          ? 'Please not the first day'
                          : null,
                      onDateSelected: (DateTime value) {
                        _Date = value;
                        print(value);
                      },
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    "Id:                 ",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(),
                        onChanged: (value) {
                          _id = value;
                        },
                      )),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Full name:   ",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: TextField(
                        onChanged: (value) {
                          _Fullname = value;
                        },
                      )),
                ],
              ),
              Flexible(
                child: SizedBox(
                  height: 10,
                ),
              ),
              Row(
                children: [
                  Text("total donations: " + counter.toString(),
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                  Flexible(
                      child: SizedBox(
                    width: double.infinity,
                  )),
                  Container(
                      width: 120,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: Colors.red),
                          onPressed: () {
                            print(_Bloodtype.toString());
                            NewRow();
                            add_donat_to_stat();
                          },
                          child: Text("Submit"))),
                  SizedBox(width: 10)
                ],
              )
            ]),
          ),
        ),
        Container(
          child: Table(
            border: TableBorder.all(),
            children: blood_statistics,
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          ),
        ),
        Container(
            //color: Colors.black12,
            height: MediaQuery.of(context).size.height * 0.5,
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                Table(
                  border: TableBorder.all(),
                  children: rows,
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                )
              ],
            ))
      ]),
    );
  }
}
