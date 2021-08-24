
import 'package:flutter_web_dashboard/api/callapi.dart';
import 'package:flutter_web_dashboard/models/Account.dart';


// import 'user_api.dart';
import 'dart:convert';

class AccountService {

  static Future<List<Account>> getUsers() async {
    final response = await CallApi().getData('account');
    List<Account> list = parseResponse(response.body);
    return list;
  }

  static List<Account> parseResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Account>((json) => Account.fromJson(json)).toList();
  }

}