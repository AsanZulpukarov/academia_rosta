import '../enum/role_user_enum.dart';

class UserRequestModel {
  String? username;
  String? password;
  UserRequestModel({this.username, this.password});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['password'] = password;
    return data;
  }
}
