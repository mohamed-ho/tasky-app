import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

abstract class AuthLocalDataSource {
  Future<void> saveToken(String token);
  Future<String?> getToken();
  Future<void> saveRefreshToken(String token);
  Future<String?> getRefreshToken();
  Future<void> deleteRefreshToken();
  Future<void> deleteToken();
  Future<bool> isTokenValid();
  Future<void> logoutUser();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final FlutterSecureStorage secureStorage;

  AuthLocalDataSourceImpl({required this.secureStorage});
  @override
  Future<void> deleteToken() async {
    await secureStorage.delete(key: 'token');
  }

  @override
  Future<String?> getToken() async {
    return await secureStorage.read(key: 'token');
  }

  @override
  Future<bool> isTokenValid() async {
    final token = await getToken();
    if (token != null) {
      return !JwtDecoder.isExpired(token);
    }
    return false;
  }

  @override
  Future<void> logoutUser() async {
    await deleteToken();
    await deleteRefreshToken();
  }

  @override
  Future<void> saveToken(String token) async {
    await secureStorage.write(key: 'token', value: token);
  }

  @override
  Future<String?> getRefreshToken() async {
    return await secureStorage.read(key: 'refreshToken');
  }

  @override
  Future<void> saveRefreshToken(String token) async {
    await secureStorage.write(key: 'refreshToken', value: token);
  }

  @override
  Future<void> deleteRefreshToken() async {
    await secureStorage.delete(key: 'refreshToken');
  }
}
