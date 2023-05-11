class Teacher {
  int? id;
  String? firstname;
  String? lastname;
  String? username;
  int? age;
  String? phoneNumber;
  String? address;
  String? role;

  Teacher(
      {this.id,
      this.firstname,
      this.lastname,
      this.username,
      this.age,
      this.phoneNumber,
      this.address,
      this.role});

  Teacher.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    username = json['username'];
    age = json['age'];
    phoneNumber = json['phoneNumber'];
    address = json['address'];
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
