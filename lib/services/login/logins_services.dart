import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:vikncodes/model/login_model.dart';

class Loginservices {
  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();
  static const loginUrl =
      'https://api.accounts.vikncodes.com/api/v1/users/login';
  Dio dio = Dio();
  Future<String?> loginUserSer(LoginModel data) async {
    final userLoginData = data.toJson();
    try {
      final response = await dio.post(loginUrl, data: userLoginData);
      if (response.statusCode == 200) {
        final refreshToken = response.data['data']['refresh'];
        final accessToken = response.data['data']['access'];

        final userId = response.data['data']['user_id'].toString();
        await _secureStorage.write(key: 'user_id', value: userId);
        await _secureStorage.write(key: 'refresh', value: refreshToken);
        await _secureStorage.write(key: 'access', value: accessToken);
        return 'success';
      }
    } on DioException catch (e) {
      log(e.message.toString());
    }
    return null;
  }
}
