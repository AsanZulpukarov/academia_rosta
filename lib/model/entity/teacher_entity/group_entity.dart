import 'package:academia_rost/model/entity/student_entity/timetable_entity.dart';
import 'package:academia_rost/model/entity/user_info.dart';

import '../subject_entity.dart';

class GroupEntity {
  int? id;
  String? name;
  SubjectEntity? subject;
  UserInfo? teacher;
  TimetableEntity? timetable;

  GroupEntity({this.id, this.name, this.subject, this.teacher, this.timetable});

  GroupEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    subject = json['subject'] != null
        ? SubjectEntity.fromJson(json['subject'])
        : null;
    teacher =
        json['teacher'] != null ? UserInfo.fromJson(json['teacher']) : null;
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
