class UserInfo {
  int? id;
  String? firstname;
  String? lastname;
  String? username;
  int? age;
  String? phoneNumber;
  String? address;
  String? role;

  UserInfo(
      {this.id,
      this.firstname,
      this.lastname,
      this.username,
      this.age,
      this.phoneNumber,
      this.address,
      this.role});

  UserInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    firstname = json['firstname'] ?? "Пусто";
    lastname = json['lastname'] ?? "Пусто";
    username = json['username'];
    age = json['age'] as int;
    phoneNumber = json['phoneNumber'] ?? "Пусто";
    address = json['address'] ?? "Пусто";
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['firstname'] = firstname;
    data['lastname'] = lastname;
    data['username'] = username;
    data['age'] = age;
    data['phoneNumber'] = phoneNumber;
    data['address'] = address;
    data['role'] = role;
    return data;
  }
}
