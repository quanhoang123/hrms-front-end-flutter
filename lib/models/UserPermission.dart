// import 'dart:convert';
//
// import 'package:flutter_web_dashboard/models/Permission.dart';
// import 'package:flutter_web_dashboard/models/Roles.dart';
//
// class UserPermission{
//   Role role;
//   List<Permission> permission;
//
//   UserPermission({
//     this.role,
//     this.permission,
//   });
//   factory UserPermission.fromJson(Map<String, dynamic> json) => UserPermission(
//     role:  Role.fromJson(json["role"]),
//     permission: List<Permission>.from(json["permission"].map((x) => Permission.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "role": role.toJson(),
//     "permission": List<UserPermission>.from(permission.map((x) => x.toJson()))
//   };
// }

import 'package:flutter_web_dashboard/models/Roles.dart';

class UserPermission {
  UserPermission({
    this.role,
    this.permission,

  });

  Role role;
  List<Role> permission;
  int status;

  factory UserPermission.fromJson(Map<String, dynamic> json) => UserPermission(
    role: Role.fromJson(json["role"]),
    permission: List<Role>.from(json["permission"].map((x) => Role.fromJson(x))),

  );

  Map<String, dynamic> toJson() => {
    "role": role.toJson(),
    "permission": List<dynamic>.from(permission.map((x) => x.toJson())),
    "status": status,
  };
}
