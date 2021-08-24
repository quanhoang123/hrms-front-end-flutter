class Account {
  final int id;
  final String name;
  final String email;
  final bool active;
  final String avatar;
  final DateTime  created;
  final DateTime  updated;

  Account({this.id,
      this.name,
      this.email,
      this.active,
      this.avatar,
      this.created,
      this.updated});



  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      avatar: json['avatar'],
      active: json['active'],
      created: DateTime.parse(json['created_at']),
      updated: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name == null ? null : name,
        'email': name == null ? null : name,
        'avatar':name == null ? null : name,
        'active': name == null ? null : name,
        'created_at': created == null ? null : created.toIso8601String(),
        'updated_at': updated == null ? null : updated.toIso8601String(),
      };

  @override
String toString() {
return 'Account{id: $id, name: $name, email: $email, password: $avatar, active: $active, created_at: $created, updated_at:$updated}';
}
}
