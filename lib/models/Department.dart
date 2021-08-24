class Department {
  Department({
    this.id,
    this.ten,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String ten;
  dynamic createdAt;
  dynamic updatedAt;

  factory Department.fromJson(Map<String, dynamic> json) => Department(
    id: json["id"],
    ten: json["ten"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "ten": ten,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}