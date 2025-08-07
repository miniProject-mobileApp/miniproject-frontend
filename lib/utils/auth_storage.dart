import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthStorage {
  static const _storage = FlutterSecureStorage();
  static const _keyToken = 'auth_token';

  //save the token
  static Future<void> saveToken(String token) async {
    await _storage.write(key: _keyToken, value: token);
  }

  //retrieve the token
  static Future<String?> getToken() async{
    return await _storage.read(key: _keyToken);
  }

  //delete token
  static Future<void> deleteToken() async {
    await _storage.delete(key: _keyToken);
  }

 }