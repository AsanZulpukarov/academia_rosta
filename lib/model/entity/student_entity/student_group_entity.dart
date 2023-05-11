import 'package:academia_rost/model/entity/student_entity/timetable_entity.dart';

import '../subject_entity.dart';

class StudentGroupEntity {
  int? id;
  String? name;
  SubjectEntity? subject;
  String? teacher;
  TimetableEntity? timetable;

  StudentGroupEntity(
      {this.id, this.name, this.subject, this.teacher, this.timetable});

  StudentGroupEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    subject = json['subject'] != null
        ? SubjectEntity.fromJson(json['subject'])
        : null;
    teacher = json['teacher'];
    timetable = json['timetable'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (subject != null) {
      data['subject'] = subject!.toJson();
    }
    data['teacher'] = teacher;
    data['timetable'] = timetable;
    return data;
  }
}
