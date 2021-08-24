

import 'package:flutter_web_dashboard/models/Decision.dart';
import 'package:flutter_web_dashboard/models/Department.dart';
import 'package:flutter_web_dashboard/models/Employee.dart';
import 'package:flutter_web_dashboard/models/ListContract.dart';

class EditEmployee {
  EditEmployee({
    this.employee,
    this.department,
    this.files,
    this.listContract,
    this.listTypeContract,
    this.listDecision,
    this.listTypeDecision,
  });

  Employee employee;
  List<Department> department;
  Map<String, String> files;
  List<ListContract> listContract;
  List<Department> listTypeContract;
  List<Decision> listDecision;
  List<Department> listTypeDecision;

  factory EditEmployee.fromJson(Map<String, dynamic> json) => EditEmployee(
    employee: Employee.fromJson(json["Employee"]),
    department: List<Department>.from(json["Department"].map((x) => Department.fromJson(x))),
    files: Map.from(json["Files"]).map((k, v) => MapEntry<String, String>(k, v)),
    listContract: List<ListContract>.from(json["ListContract"].map((x) => ListContract.fromJson(x))),
    listTypeContract: List<Department>.from(json["ListTypeContract"].map((x) => Department.fromJson(x))),
    listDecision: List<Decision>.from(json["ListDecision"].map((x) => Decision.fromJson(x))),
    listTypeDecision: List<Department>.from(json["ListTypeDecision"].map((x) => Department.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Employee": employee.toJson(),
    "Department": List<dynamic>.from(department.map((x) => x.toJson())),
    "Files": Map.from(files).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "ListContract": List<dynamic>.from(listContract.map((x) => x.toJson())),
    "ListTypeContract": List<dynamic>.from(listTypeContract.map((x) => x.toJson())),
    "ListDecision": List<dynamic>.from(listDecision.map((x) => x.toJson())),
    "ListTypeDecision": List<dynamic>.from(listTypeDecision.map((x) => x.toJson())),
  };
}