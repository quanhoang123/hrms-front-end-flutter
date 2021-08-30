class Part {
  Part({
    this.id,
    this.ten,
    this.phongbanId,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String ten;
  int phongbanId;
  dynamic createdAt;
  dynamic updatedAt;

  factory Part.fromJson(Map<String, dynamic> json) => Part(
    id: json["id"],
    ten: json["ten"],
    phongbanId: json["phongban_id"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "ten": ten,
    "phongban_id": phongbanId,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}