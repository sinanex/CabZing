import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:vikncodes/model/usermodel.dart';

class Loginservices {
  FlutterSecureStorage _secureStorage = FlutterSecureStorage();
  static const loginUrl =
      'https://api.accounts.vikncodes.com/api/v1/users/login';
  Dio dio = Dio();
  void loginUser(Usermodel data) async {
    final userLoginData = data.toJson();
    try {
      final response = await dio.post(loginUrl, data: userLoginData);
      if (response.statusCode == 200) {
        log("login succes ${response.data['data']['refresh']}");
        final refreshToken = response.data['data']['refresh'];
        final accessToken = response.data['data']['access'];
        _secureStorage.write(key: 'refresh', value: refreshToken);
        _secureStorage.write(key: 'access', value: accessToken);
      }
    } on DioException catch (e) {
      log(e.message.toString());
    }
  }
}
