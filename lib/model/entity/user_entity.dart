enum Gender { male, female }

enum Role {
  student,
  teacher,
}

class UserLoginPassword {
  String? userName;
  String? _password;
  String? _token;
}

abstract class User {
  UserLoginPassword? userLoginPassword;
  String? firstName;
  String? lastName;
  String? fatherName;
  int? age;
  String? phoneNumber;
  String? address;
  late Gender gender;
  late Role role;
}
