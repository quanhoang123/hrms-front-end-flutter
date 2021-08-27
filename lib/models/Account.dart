import 'package:flutter_web_dashboard/models/Roles.dart';

class Account {
  final int id;
  final String name;
  final String email;
  final String password;
  final bool active;
  final String avatar;
  List<Role> roles;
  final DateTime  created;
  final DateTime  updated;

  Account({this.id,
      this.name,
      this.email,
      this.password,
      this.active,
      this.avatar,
      this.roles,
      this.created,
      this.updated});



  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      avatar: json['avatar'],
      active: json['active'],
      created: DateTime.parse(json['created_at']),
      updated: DateTime.parse(json['updated_at']),
      roles: json["roles"] == null ? null : List<Role>.from(json["roles"].map((x) => Role.fromJson(x))),
      // roles: List<Role>.from(json["roles"].map((x) => Role.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name == null ? null : name,
        'email': name == null ? null : name,
        'avatar':name == null ? null : name,
        'active': name == null ? null : name,
        'created_at': created == null ? null : created.toIso8601String(),
        'updated_at': updated == null ? null : updated.toIso8601String(),
        // "roles": List<dynamic>.from(roles.map((x) => x.toJson())),
      };

  @override
  String toString() {
  return 'Account{id: $id, name: $name, email: $email, password: $password, avatart:$avatar, active: $active, created_at: $created, updated_at:$updated}';
  }
}


// Get id edit
class AccountRole{
  AccountRole({
    this.user,
    this.roles,
    this.status,
  });

  Account user;
  List<Role> roles;
  int status;

  factory AccountRole.fromJson(Map<String, dynamic> json) => AccountRole(
    user: Account.fromJson(json["user"]),
    roles: List<Role>.from(json["roles"].map((x) => Role.fromJson(x))),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "user": user.toJson(),
    "roles": List<dynamic>.from(roles.map((x) => x.toJson())),
    "status": status,
  };
}