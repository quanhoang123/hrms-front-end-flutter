import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CallApi {
  final String _url = 'https://hrmanagerment.herokuapp.com/api/';
  var token;

  postData(data, apiUrl) async {
    var fullUrl = _url + apiUrl + await _getToken();
    return await http.post(Uri.parse(fullUrl),
        headers: _setHeaders(), body: jsonEncode(data));
  }

  putData(data,apiUrl) async {
    var fullUrl = _url + apiUrl + await _getToken();
    return await http.post(Uri.parse(fullUrl),
        headers: _setHeaders(), body: jsonEncode(data));
  }


  deleteData(apiUrl) async {
    var fullUrl = _url + apiUrl + await _getToken();
    return await http.delete(Uri.parse(fullUrl));
  }


  getData(apiUrl) async {
    var fullUrl = _url + apiUrl + await _getToken();
    return await http.get(Uri.parse(fullUrl));
  }

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization' : 'Bearer $token'
      };

  _getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = localStorage.getString('token');
    return '?token=$token';
  }

  getArticles(apiUrl) async {}  
  getPublicData(apiUrl) async {}

  // getApi(apiUrl) async {
  //   var fullUrl = _url + apiUrl;
    
  //   return await http.get(Uri.parse(fullUrl));
  // }
}
