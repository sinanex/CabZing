import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ProfileServices {
  FlutterSecureStorage _secureStorage = FlutterSecureStorage();
  Dio dio = Dio();

  void getProfileData() async {
    final accessToken = _secureStorage.read(key: 'access');
    final headers = {'Authorization': 'Bearer $accessToken'};
    final userid = await _secureStorage.read(key: 'user_id');
    final baseUrl =
        'https://www.api.viknbooks.com/api/v10/users/user-view/$userid';
    if (userid != null) {
      dio.get(baseUrl, options: Options(headers: headers));
    }
  }
}
