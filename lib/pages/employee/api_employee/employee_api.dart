

import 'dart:convert';

import 'package:flutter_web_dashboard/api/callapi.dart';
import 'package:flutter_web_dashboard/models/Department.dart';
import 'package:flutter_web_dashboard/models/Employee.dart';
import 'package:flutter_web_dashboard/models/File.dart';
import 'package:flutter_web_dashboard/models/Part.dart';


class EmployeeService{

  static Future<List<Employee>> getEmployees() async {
    final response = await CallApi().getData('employee');
    if(response.statusCode==200){
      List<Employee> list = parseResponse(response.body);
      return list;
    }else{
      print('Empty');
    }
  }

  static List<Employee> parseResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Employee>((json) => Employee.fromJson(json)).toList();
  }



  // Get hoso

  static Future<List<FileElement>> getFileAdd() async {
    final response = await CallApi().getData('get-file');
    if(response.statusCode==200){
      List<FileElement> list = parseRes(response.body);
      return list;
    }else{
      print('Empty');
    }
  }

  static List<FileElement> parseRes(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<FileElement>((json) => FileElement.fromJson(json)).toList();
  }

  //Get Bo Phan theo Phong Ban
  static Future<List<Part>> getParts(id) async {
      final response = await CallApi().getData('bophan-employee/$id');
      if(response.statusCode==200){
        List<Part> list = CastResponse(response.body);
        return list;
      }else{
        print('Empty');
      }
    }
    static List<Part> CastResponse(String responseBody) {
      final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
      return parsed.map<Part>((json) => Part.fromJson(json)).toList();
    }

  //Get Danh Sach Phong Ban
  static Future<List<Department>> getDepartment() async {

    final response = await CallApi().getData('get-department');
    if(response.statusCode==200){
      List<Department> list = CastRespon(response.body);
      return list;
    }else{
      print('Empty');
    }
  }

  static List<Department> CastRespon(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Department>((json) => Department.fromJson(json)).toList();
  }

  // static Future<PartEmployee> getPartbyDepartment(id) async{
  //   final response = await CallApi().getData('get-department/$id');
  //   if(response.statusCode == 200){
  //     final parsed = json.decode(response.body);
  //     final data= PartEmployee.fromJson(parsed);
  //     // print(parsed);
  //     return data;
  //   }
  // }


}