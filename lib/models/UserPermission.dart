

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
