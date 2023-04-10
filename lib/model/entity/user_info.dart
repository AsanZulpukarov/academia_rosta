class UserInfo {
  int? id;
  String? firstname;
  String? lastname;
  String? username;
  int? age;
  String? role;

  UserInfo(
      {this.id,
      this.firstname,
      this.lastname,
      this.username,
      this.age,
      this.role});

  UserInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    firstname = json['firstname'] as String;
    lastname = json['lastname'] as String;
    username = json['username'] as String;
    age = json['age'];
    role = json['role'] as String;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['firstname'] = firstname;
    data['lastname'] = lastname;
    data['username'] = username;
    data['age'] = age;
    data['role'] = role;
    return data;
  }
}
