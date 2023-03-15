import 'package:academi_rost/model/entity/user_entity.dart';

class StudentUser extends User {
  String role = 'student';
  late List<MyCourses> myCourses;
  late Statistics myStatistics;
}

class MyCourses {}

class Statistics {}
