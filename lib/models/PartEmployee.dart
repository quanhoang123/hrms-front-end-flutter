import 'dart:convert';

import 'package:flutter_web_dashboard/models/Department.dart';
import 'package:flutter_web_dashboard/models/Part.dart';

PartEmployee welcomeFromJson(String str) => PartEmployee.fromJson(json.decode(str));

String welcomeToJson(PartEmployee data) => json.encode(data.toJson());

class PartEmployee {
  PartEmployee({
    this.phongban,
    this.bophan,

  });

  List<Department> phongban;
  List<Part> bophan;


  factory PartEmployee.fromJson(Map<String, dynamic> json) => PartEmployee(
    phongban: List<Department>.from(json["phongban"].map((x) => Department.fromJson(x))),
    bophan: List<Part>.from(json["bophan"].map((x) => Part.fromJson(x))),

  );

  Map<String, dynamic> toJson() => {
    "phongban": List<dynamic>.from(phongban.map((x) => x.toJson())),
    "bophan": List<dynamic>.from(bophan.map((x) => x.toJson())),

  };
}