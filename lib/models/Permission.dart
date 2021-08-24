
class Permission {
  Permission({
    this.id,
    this.name,
    this.displayName,
    this.description,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String name;
  String displayName;
  String description;
  DateTime createdAt;
  DateTime updatedAt;

  factory Permission.fromJson(Map<String, dynamic> json) => Permission(
    id: json["id"],
    name: json["name"],
    displayName: json["display_name"],
    description: json["description"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "display_name": displayName,
    "description": description,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}