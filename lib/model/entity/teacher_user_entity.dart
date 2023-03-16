import 'package:academi_rost/model/entity/student_user_entity.dart';
import 'package:academi_rost/model/entity/user_entity.dart';

class TeacherUser extends User {
  late List<Group> myGroup;
  late DateTime enrollmentDate;
}

class Group {
  late List<StudentUser> students;
}
