import 'package:bloodbank/Drawer_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'datasaver.dart';

class Surgery_and_trauma extends StatefulWidget {
  const Surgery_and_trauma({super.key});

  @override
  State<Surgery_and_trauma> createState() => _Surgery_and_traumaState();
}

class _Surgery_and_traumaState extends State<Surgery_and_trauma> {
  var data = datasaver.datasaverapp();
  var _Bloodtype;
  var _Amount;
  var Amount;

  Future alertwedgit(String report) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
          title: Text("Error, in blood bank data!",
              style: TextStyle(fontSize: 22)),
          content: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              color: Colors.black12,
            ),
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width * 0.4,
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  report,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Flexible(
                        child: SizedBox(
                      width: double.infinity,
                    )),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red),
                        onPressed: () => Navigator.pop(context),
                        child: Text("Ok")),
                    SizedBox(
                      width: 10,
                    )
                  ],
                )
              ],
            ),
          )),
    );
  }

  void bloodcheck_zero(blood_map, String bloodtype) {
    var max_value = 0;
    var max_key;

    blood_map.forEach((k, v) {
      if (v > max_value) {
        max_value = v;
        max_key = k;
      }
    });
    if (max_value == 0) {
      alertwedgit("- There are no more blood stock of type " +
          bloodtype +
          "! \n- There are no alternative in the meaning time!");
    } else {
      alertwedgit("- There are no more blood stock of type" +
          bloodtype +
          " \n- you can use " +
          max_key.toString() +
          " as alternative for that.");
    }
  }

  void bloodcheck_nozero_smallertamount(
      blood_map, String bloodtype, blood_type_var) {
    var max_value = 0;
    var max_key;

    blood_map.forEach((k, v) {
      if (v > max_value) {
        max_value = v;
        max_key = k;
      }
    });
    if (max_value == 0) {
      alertwedgit("- There are just " +
          blood_type_var.toString() +
          "blood meal in the blood stock of type " +
          bloodtype +
          "! \n - There are no alternative in the meaning time!");
    } else {
      alertwedgit("- There are just " +
          blood_type_var.toString() +
          " blood meal in the blood stock of type " +
          bloodtype +
          " \n- you can use " +
          max_key.toString() +
          " as alternative for that.");
    }
  }

  String to_percent(var num) {
    double x = ((num / data.counter) * 100);
    return x.toStringAsFixed(1) + "%";
  }

  void update_stastics() {
    data.blood_statistics[1] = TableRow(children: [
      Container(
          height: 40,
          alignment: Alignment.center,
          child: Text(to_percent(data.Oplus), style: TextStyle(fontSize: 15))),
      Container(
          height: 40,
          alignment: Alignment.center,
          child: Text(to_percent(data.Aplus), style: TextStyle(fontSize: 15))),
      Container(
          height: 40,
          alignment: Alignment.center,
          child: Text(to_percent(data.Bplus), style: TextStyle(fontSize: 15))),
      Container(
          height: 40,
          alignment: Alignment.center,
          child: Text(to_percent(data.ABplus), style: TextStyle(fontSize: 15))),
      Container(
          height: 40,
          alignment: Alignment.center,
          child: Text(to_percent(data.Ominus), style: TextStyle(fontSize: 15))),
      Container(
          height: 40,
          alignment: Alignment.center,
          child: Text(to_percent(data.Aminus), style: TextStyle(fontSize: 15))),
      Container(
          height: 40,
          alignment: Alignment.center,
          child: Text(to_percent(data.Bminus), style: TextStyle(fontSize: 15))),
      Container(
          height: 40,
          alignment: Alignment.center,
          child: Text(to_percent(data.ABminus), style: TextStyle(fontSize: 15)))
    ], decoration: BoxDecoration(color: Colors.black12));
  }

  void drawing_blood() {
    setState(() {
      Map<String, int> g = {};

      if (_Bloodtype == "O+") {
        g.addAll({"O-": data.Ominus});
        var sortMapByValue = Map.fromEntries(
            g.entries.toList()..sort((e1, e2) => e1.value.compareTo(e2.value)));

        if (data.Oplus == 0) {
          bloodcheck_zero(sortMapByValue, _Bloodtype);
        } else if (Amount > data.Oplus && data.Oplus > 0) {
          bloodcheck_nozero_smallertamount(
              sortMapByValue, _Bloodtype, data.Aplus);
        } else {
          data.Oplus -= Amount as int;
          data.counter -= Amount as int;
          update_stastics();
        }

        // data.Oplus++;
      } else if (_Bloodtype == "A+") {
        g.addAll({"O-": data.Ominus, "O+": data.Oplus, "A-": data.Aminus});
        var sortMapByValue = Map.fromEntries(
            g.entries.toList()..sort((e1, e2) => e1.value.compareTo(e2.value)));
        print(sortMapByValue);

        if (data.Aplus == 0) {
          bloodcheck_zero(sortMapByValue, _Bloodtype);
        } else if (Amount > data.Aplus && data.Aplus > 0) {
          bloodcheck_nozero_smallertamount(
              sortMapByValue, _Bloodtype, data.Aplus);
        } else {
          data.Aplus -= Amount as int;
          data.counter -= Amount as int;
          update_stastics();
        }

        // data.Aplus++;
      } else if (_Bloodtype == "B+") {
        g.addAll({"O-": data.Ominus, "O+": data.Oplus, "B-": data.Bminus});
        var sortMapByValue = Map.fromEntries(
            g.entries.toList()..sort((e1, e2) => e1.value.compareTo(e2.value)));
        print(sortMapByValue);

        if (data.Bplus == 0) {
          bloodcheck_zero(sortMapByValue, _Bloodtype);
        } else if (Amount > data.Bplus && data.Bplus > 0) {
          bloodcheck_nozero_smallertamount(
              sortMapByValue, _Bloodtype, data.Aplus);
        } else {
          data.Bplus -= Amount as int;
          data.counter -= Amount as int;
          update_stastics();
        }
      } else if (_Bloodtype == "AB+") {
        g.addAll({
          "O-": data.Ominus,
          "O+": data.Oplus,
          "A-": data.Aminus,
          "AB-": data.ABminus,
          "A+": data.Aplus,
          "B-": data.Bminus,
          "B+": data.Bplus
        });
        var sortMapByValue = Map.fromEntries(
            g.entries.toList()..sort((e1, e2) => e1.value.compareTo(e2.value)));
        print(sortMapByValue);

        if (data.ABplus == 0) {
          bloodcheck_zero(sortMapByValue, _Bloodtype);
        } else if (Amount > data.ABplus && data.ABplus > 0) {
          bloodcheck_nozero_smallertamount(
              sortMapByValue, _Bloodtype, data.Aplus);
        } else {
          data.ABplus -= Amount as int;
          data.counter -= Amount as int;
          update_stastics();
        }

        // data.ABplus++;
      } else if (_Bloodtype == "O-") {
        g.addAll({});
        var sortMapByValue = Map.fromEntries(
            g.entries.toList()..sort((e1, e2) => e1.value.compareTo(e2.value)));
        print(sortMapByValue);

        if (data.Ominus == 0) {
          bloodcheck_zero(sortMapByValue, _Bloodtype);
        } else if (Amount > data.Ominus && data.Ominus > 0) {
          bloodcheck_nozero_smallertamount(
              sortMapByValue, _Bloodtype, data.Aplus);
        } else {
          data.Ominus -= Amount as int;
          data.counter -= Amount as int;
          update_stastics();
        }

        // data.Ominus++;
      } else if (_Bloodtype == "A-") {
        g.addAll({"O-": data.Ominus});
        var sortMapByValue = Map.fromEntries(
            g.entries.toList()..sort((e1, e2) => e1.value.compareTo(e2.value)));
        print(sortMapByValue);
        if (data.Aminus == 0) {
          bloodcheck_zero(sortMapByValue, _Bloodtype);
        } else if (Amount > data.Aminus && data.Aminus > 0) {
          bloodcheck_nozero_smallertamount(
              sortMapByValue, _Bloodtype, data.Aplus);
        } else {
          data.Aminus -= Amount as int;
          data.counter -= Amount as int;
          update_stastics();
        }

        // data.Aminus++;
      } else if (_Bloodtype == "B-") {
        g.addAll({"O-": data.Ominus});
        var sortMapByValue = Map.fromEntries(
            g.entries.toList()..sort((e1, e2) => e1.value.compareTo(e2.value)));
        if (data.Bminus == 0) {
          bloodcheck_zero(sortMapByValue, _Bloodtype);
        } else if (Amount > data.Bminus && data.Bminus > 0) {
          bloodcheck_nozero_smallertamount(
              sortMapByValue, _Bloodtype, data.Aplus);
        } else {
          data.Bminus -= Amount as int;
          data.counter -= Amount as int;
          update_stastics();
        }
      } else if (_Bloodtype == "AB-") {
        g.addAll({"O-": data.Ominus, "B-": data.Bminus, "A-": data.Aminus});
        var sortMapByValue = Map.fromEntries(
            g.entries.toList()..sort((e1, e2) => e1.value.compareTo(e2.value)));
        print(sortMapByValue);
        if (data.ABminus == 0) {
          bloodcheck_zero(sortMapByValue, _Bloodtype);
        } else if (Amount > data.ABminus && data.ABminus > 0) {
          bloodcheck_nozero_smallertamount(
              sortMapByValue, _Bloodtype, data.Aplus);
        } else {
          data.ABminus -= Amount as int;
          data.counter -= Amount as int;
          update_stastics();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer_main(context),
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          "Blood bank",
          style: TextStyle(fontSize: 19),
        ),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.amberAccent,
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Blood type: ",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
                          items: data.Blood_types.map<DropdownMenuItem<String>>(
                              (String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(fontSize: 19),
                              ),
                            );
                          }).toList(),
                        )),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Amount:      ",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: TextField(
                          keyboardType: TextInputType.datetime,
                          decoration: InputDecoration(),
                          onChanged: (value) {
                            _Amount = value;
                            Amount = int.parse(_Amount);
                          },
                        )),
                  ],
                ),
                SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
          Container(
            child: Table(
              border: TableBorder.all(),
              children: data.blood_statistics,
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            ),
          ),
          Row(
            children: [
              Text("total donations: " + data.counter.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              Flexible(
                  child: SizedBox(
                width: double.infinity,
              )),
              Container(
                  width: 120,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.red),
                      onPressed: () {
                        //print(_Bloodtype.toString());
                        drawing_blood();
                      },
                      child: Text("Submit"))),
              SizedBox(width: 10)
            ],
          )
        ],
      ),
    );
  }
}
