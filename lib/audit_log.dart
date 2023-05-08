import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class audit_log {
  static audit_log _main_log = new audit_log();
  _audit_log() {}
  static audit_log main_audit_log() {
    return _main_log;
  }

  List audit_log_list = [];

  void add_log(log, date, department) {
    Map log_map = {"log": log, "log_date": date, "department": department};
    audit_log_list.add(log_map);
    print(audit_log_list);
  }
}
