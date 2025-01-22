import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ProfileServices {
  FlutterSecureStorage _secureStorage = FlutterSecureStorage();
  Dio dio = Dio();
  void getProfileData() async {
    try {
      final accessToken = await _secureStorage.read(key: 'access');
      final headers = {'Authorization': 'Bearer $accessToken'};
      final userid = await _secureStorage.read(key: 'user_id');
      final baseUrl =
          'https://www.api.viknbooks.com/api/v10/users/user-view/$userid';
      if (userid != null) {
        final response =
            await dio.get(baseUrl, options: Options(headers: headers));
        if (response.statusCode == 200) {
          log('success ${response.data['data']['first_name']}');
          final name = response.data['data']['first_name'];
          final email = response.data['data']['email'];
          final photo = response.data['customer_data']['photo'];
          await _secureStorage.write(key: 'name', value: name);
          await _secureStorage.write(key: 'email', value: email);
          await _secureStorage.write(key: 'photo', value: photo);

          print("$name $email $photo");
        }
      }
    } on DioException catch (e) {
      log(e.message.toString());
    }
  }
}
