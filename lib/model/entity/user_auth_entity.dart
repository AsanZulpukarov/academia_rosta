class UserAuthEntity {
  String? username;
  String? password;
  UserAuthEntity({this.username, this.password});
  Map<String, dynamic> toJson() => {
        'username': username,
        'password': password,
      };
}
