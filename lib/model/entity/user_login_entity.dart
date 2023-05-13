import 'package:academia_rost/service/storage_service/storage_service.dart';

class UserLoginEntity {
  String? token;
  String? roleUser;
  String? username;

  StorageService storageService = StorageService();
  bool register = false;

  UserLoginEntity() {
    getAllData();
  }

  void fromJson(Map<String, dynamic> json, bool rememberMe, String login) {
    token = json['token'] as String;
    roleUser = json['role'];
    register = rememberMe;
    username = login;
    if (register) {
      setAllData();
    }
  }

  void getAllData() async {
    token = await storageService.getToken();
    roleUser = await storageService.getRole();
    register = await storageService.getRememberMe() == "false" ? false : true;
    username = await storageService.getUsername();
  }

  void setAllData() async {
    await storageService.setToken(token!);
    await storageService.setRole(roleUser!);
    await storageService.setRememberMe(register.toString());
    await storageService.setUsername(username!);
  }

  void deleteAllData() {
    storageService.deleteAllSecureData();
    token = "";
    roleUser = "";
    register = false;
    username = "";
  }
}
