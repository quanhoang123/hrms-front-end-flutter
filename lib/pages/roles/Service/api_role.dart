
import 'package:flutter_web_dashboard/api/callapi.dart';
import 'package:flutter_web_dashboard/models/Roles.dart';

import 'dart:convert';

import 'package:flutter_web_dashboard/models/UserPermission.dart';
class RolesService{

  static Future<List<Role>> getRoles() async {
    final response = await CallApi().getData('roles');
    List<Role> list = parseResponse(response.body);
    print(response.body);
    return list;
  }

  static List<Role> parseResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Role>((json) => Role.fromJson(json)).toList();
  }

  static Future<UserPermission> getRoleEdit(id) async{
    final response = await CallApi().getData('edit-role/$id');
    // print(response.body);
    if(response.statusCode == 200){
      final parsed = json.decode(response.body);
      final data= UserPermission.fromJson(parsed);
      // print(parsed);
      return data;
    }
  }


}