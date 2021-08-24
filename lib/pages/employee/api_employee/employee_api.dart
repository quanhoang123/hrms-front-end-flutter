

import 'dart:convert';

import 'package:flutter_web_dashboard/api/callapi.dart';
import 'package:flutter_web_dashboard/models/Employee.dart';

class EmployeeService{

  static Future<List<Employee>> getEmployees() async {
    final response = await CallApi().getData('employee');
    print(response.statusCode);
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



}