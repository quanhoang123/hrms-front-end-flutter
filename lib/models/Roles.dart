
import 'package:flutter_web_dashboard/models/Pilots.dart';


class Role {
  Role({
    this.id,
    this.name,
    this.displayName,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.permissions,
    this.pivot,
  });

  int id;
  String name;
  String displayName;
  String description;
  DateTime createdAt;
  DateTime updatedAt;
  List<Role> permissions;
  Pivot pivot;

  factory Role.fromJson(Map<String, dynamic> json) => Role(
    id: json["id"],
    name: json["name"],
    displayName: json["display_name"],
    description: json["description"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    permissions: json["permissions"] == null ? null : List<Role>.from(json["permissions"].map((x) => Role.fromJson(x))),
    pivot: json["pivot"] == null ? null : Pivot.fromJson(json["pivot"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "display_name": displayName,
    "description": description,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "permissions": permissions == null ? null : List<dynamic>.from(permissions.map((x) => x.toJson())),
    "pivot": pivot == null ? null : pivot.toJson(),
  };
}
