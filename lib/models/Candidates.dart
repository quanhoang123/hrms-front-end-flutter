// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    this.candidates,
  });

  List<Candidate> candidates;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    candidates: List<Candidate>.from(json["Candidates"].map((x) => Candidate.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Candidates": List<dynamic>.from(candidates.map((x) => x.toJson())),
  };
}

class Candidate {
  Candidate({
    this.id,
    this.nameEmp,
    this.gender,
    this.dienthoai,
    this.email,
    this.fileCv,
    this.address,
    this.position,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String nameEmp;
  bool gender;
  String dienthoai;
  String email;
  String fileCv;
  String address;
  String position;
  bool status;
  dynamic createdAt;
  dynamic updatedAt;

  factory Candidate.fromJson(Map<String, dynamic> json) => Candidate(
    id: json["id"],
    nameEmp: json["nameEmp"],
    gender: json["gender"],
    dienthoai: json["dienthoai"],
    email: json["email"],
    fileCv: json["file_cv"],
    address: json["address"],
    position: json["position"],
    status: json["status"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nameEmp": nameEmp,
    "gender": gender,
    "dienthoai": dienthoai,
    "email": email,
    "file_cv": fileCv,
    "address": address,
    "position": position,
    "status": status,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}
