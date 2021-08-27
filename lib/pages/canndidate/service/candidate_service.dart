import 'dart:convert';

import 'package:flutter_web_dashboard/api/callapi.dart';
import 'package:flutter_web_dashboard/models/Candidates.dart';

class CandidateService{

  static Future<List<Candidate>> getData() async {
    final response = await CallApi().getData('ungtuyen');
    List<Candidate> list = parseResponse(response.body);
    print(response.body);
    return list;
  }
  static List<Candidate> parseResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Candidate>((json) => Candidate.fromJson(json)).toList();
  }

}