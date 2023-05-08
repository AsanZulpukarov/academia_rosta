import '../entity/user_login_entity.dart';
import '../enum/role_user_enum.dart';

class StaticVariable {

  static String urlIp = '192.168.58.93:8080';
  static UserLoginEntity userLoginEntity = UserLoginEntity();

  static const Map<RoleUser, String> roleUser = {
    RoleUser.student: "ROLE_PUPIL",
    RoleUser.teacher: "ROLE_TEACHER"
  };

  static const String errorFuture = "Ошибка при подключении к серверу";
}
