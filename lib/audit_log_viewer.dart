import 'package:bloodbank/Drawer_main.dart';
import 'package:bloodbank/audit_log.dart';
import 'package:flutter/material.dart';
import 'mobile.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
// s 'package:syncfusion_flutter_pdf/pdf.dart';

class audit_log_viewer extends StatefulWidget {
  const audit_log_viewer({super.key});

  @override
  State<audit_log_viewer> createState() => _audit_log_viewerState();
}

Widget audit_view(audit_unit) {
  String formattedDate =
      "${audit_unit["log_date"].year}-${audit_unit["log_date"].month}-${audit_unit["log_date"].day}";
  String formattedTime =
      "${audit_unit["log_date"].hour}:${audit_unit["log_date"].minute}";
  return Container(
    decoration: BoxDecoration(
        color: Colors.amber,
        border: Border.symmetric(horizontal: BorderSide())),
    child: Column(
      children: [
        SizedBox(
          height: 5,
        ),
        Text(
          audit_unit["department"],
          style: TextStyle(color: Colors.red, fontSize: 19),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          audit_unit["log"],
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        SizedBox(
          height: 5,
        ),
        Text(formattedDate + " " + formattedTime)
      ],
    ),
  );
}

class _audit_log_viewerState extends State<audit_log_viewer> {
  var log = audit_log.main_audit_log();
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
        body: Container(
          color: Colors.black12,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                "Audit Log",
                style: TextStyle(
                    fontSize: 25,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Flexible(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: ListView.builder(
                      itemCount: log.audit_log_list.length,
                      itemBuilder: (context, index) =>
                          audit_view(log.audit_log_list[index])),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 50,
                width: 150,
                child: ElevatedButton(
                  onPressed: _createPDF,
                  child: Text("convert to pdf"),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                ),
              ),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ));
  }

  Future<void> _createPDF() async {
    PdfDocument document = PdfDocument();
    final page = document.pages.add();

    PdfGrid grid = PdfGrid();
    grid.style = PdfGridStyle(
        font: PdfStandardFont(PdfFontFamily.helvetica, 10),
        cellPadding: PdfPaddings(left: 2, right: 2, top: 2, bottom: 2));

    grid.columns.add(count: 3);
    grid.headers.add(1);

    PdfGridRow header = grid.headers[0];
    header.cells[0].value = 'Department';
    header.cells[1].value = 'date';
    header.cells[2].value = 'Action';
    PdfGridRow row;

    for (var i in log.audit_log_list) {
      print("ddddS");
      String formattedDate =
          "${i["log_date"].year}-${i["log_date"].month}-${i["log_date"].day}";
      String formattedTime = "${i["log_date"].hour}:${i["log_date"].minute}";
      row = grid.rows.add();
      row.cells[0].value = i["department"].toString();
      row.cells[1].value = formattedDate + " " + formattedTime;
      row.cells[2].value = i["log"].toString();
    }

    grid.draw(page: page, bounds: const Rect.fromLTWH(0, 0, 0, 0));

    List<int> bytes = document.save();
    document.dispose();

    saveAndLaunchFile(bytes, 'Output.pdf');
  }
}
