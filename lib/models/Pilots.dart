
class Pivot {
  Pivot({
    this.roleId,
    this.permissionId,
  });

  int roleId;
  int permissionId;

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
    roleId: json["role_id"],
    permissionId: json["permission_id"],
  );

  Map<String, dynamic> toJson() => {
    "role_id": roleId,
    "permission_id": permissionId,
  };
}
