import 'package:academi_rost/model/entity/student_user_entity.dart';
import 'package:academi_rost/model/entity/user_entity.dart';

class TeacherUser extends User {
  String role = 'teacher';
  late List<Group> myGroup;
}

class Group {
  late List<StudentUser> students;
}
