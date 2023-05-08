import 'package:bloodbank/Blood_donation.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:bloodbank/audit_log.dart';

import 'Drawer_main.dart';
import 'datasaver.dart';

class Emergency extends StatefulWidget {
  const Emergency({super.key});

  @override
  State<Emergency> createState() => _EmergencyState();
}

class _EmergencyState extends State<Emergency> {
  String report = "";
  String Error_s = "Error, in blood bank data!";
  String fixed_s = "Process completed succesfully!";
  var data = datasaver.datasaverapp();
  var log = audit_log.main_audit_log();

  Future check_blood_storage(report, title) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12))),
          title: Text(title, style: TextStyle(fontSize: 22)),
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

  void check_Blood_Ominus() {
    setState(() {
      if (data.Ominus == 0) {
        report = "There are no more O- blood meals in the blood bank storage.";
        check_blood_storage(report, Error_s);
      } else {
        report = "There are " +
            data.Ominus.toString() +
            " O- blood meals in the blood bank storage." +
            "\n loaded successfully! ";
        check_blood_storage(report, fixed_s);
        data.Ominus = 0;
      }

      log.add_log(report, DateTime.now(), "MCI Emergency department");
    });
  }

  @override
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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Container(
                alignment: Alignment.topCenter,
                child: Text(
                  "MCI Emergency",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                )),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 150,
              height: 50,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  onPressed: () {
                    check_Blood_Ominus();
                  },
                  child: Text("check")),
            )
          ],
        ));
  }
}
