import '../subject_entity.dart';

class GroupEntity {
  int? id;
  String? name;
  Subject? subject;
  Teacher? teacher;
  Null? timetable;

  GroupEntity({this.id, this.name, this.subject, this.teacher, this.timetable});

  GroupEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    subject =
        json['subject'] != null ? Subject.fromJson(json['subject']) : null;
    teacher =
        json['teacher'] != null ? Teacher.fromJson(json['teacher']) : null;
    timetable = json['timetable'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (subject != null) {
      data['subject'] = subject!.toJson();
    }
    if (teacher != null) {
      data['teacher'] = teacher!.toJson();
    }
    data['timetable'] = timetable;
    return data;
  }
}

class Teacher {
  int? id;
  String? firstname;
  String? lastname;
  String? username;
  int? age;
  Null? phoneNumber;
  Null? address;
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
