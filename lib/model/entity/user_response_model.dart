import '../enum/role_user_enum.dart';

class UserResponseModel {
  String? token;
  RoleUser? roleUser;

  bool register = false;

  UserResponseModel();

  UserResponseModel.fromJson(Map<String, dynamic> json) {
    token = json['token'] as String;
    roleUser =
        json['role'] == "ROLE_PUPIL" ? RoleUser.student : RoleUser.teacher;
  }

  void fromJson(Map<String, dynamic> json) {
    token = json['token'] as String;
    roleUser =
        json['role'] == "ROLE_PUPIL" ? RoleUser.student : RoleUser.teacher;
  }
}
