import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class _StorageServiceKey {
  static const String tokenKey = "token";
  static const String roleKey = "role";
  static const String rememberMeKey = "rememberMe";
  static const String usernameKey = "username";
}

class StorageService {
  final _secureStorage = const FlutterSecureStorage();

  Future<void> deleteAllSecureData() async {
    await _secureStorage.deleteAll();
  }

  Future<String> getToken() async {
    return await _secureStorage.read(key: _StorageServiceKey.tokenKey) ?? "";
  }

  Future<String> getRole() async {
    return await _secureStorage.read(key: _StorageServiceKey.roleKey) ?? "";
  }

  Future<String> getRememberMe() async {
    return await _secureStorage.read(key: _StorageServiceKey.rememberMeKey) ??
        "false";
  }

  Future<String> getUsername() async {
    return await _secureStorage.read(key: _StorageServiceKey.usernameKey) ?? "";
  }

  Future<void> setToken(String token) async {
    return await _secureStorage.write(
        key: _StorageServiceKey.tokenKey, value: token);
  }

  Future<void> setRole(String role) async {
    return await _secureStorage.write(
        key: _StorageServiceKey.roleKey, value: role);
  }

  Future<void> setRememberMe(String rememberMe) async {
    return await _secureStorage.write(
        key: _StorageServiceKey.rememberMeKey, value: rememberMe);
  }

  Future<void> setUsername(String username) async {
    return await _secureStorage.write(
        key: _StorageServiceKey.usernameKey, value: username);
  }
}
