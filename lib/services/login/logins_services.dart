import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:vikncodes/model/usermodel.dart';

class Loginservices {
  FlutterSecureStorage _secureStorage = FlutterSecureStorage();
  static const loginUrl =
      'https://api.accounts.vikncodes.com/api/v1/users/login';
  Dio dio = Dio();
  Future<String?> loginUser(Usermodel data) async {
    final userLoginData = data.toJson();
    try {
      final response = await dio.post(loginUrl, data: userLoginData);
      if (response.statusCode == 200) {
        log("login succes ${response.data['data']['refresh']} ${response.data['data']['user_id']}");
        final refreshToken = response.data['data']['refresh'];
        final accessToken = response.data['data']['access'];
        final userId = response.data['data']['user_id'].toString();
        _secureStorage.write(key: 'user_id', value:userId );
        _secureStorage.write(key: 'refresh', value: refreshToken);
        _secureStorage.write(key: 'access', value: accessToken);
        return 'success';
      }
    } on DioException catch (e) {
      log(e.message.toString());
    }
  }
}
