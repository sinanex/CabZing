import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:vikncodes/model/invoice_model.dart';

class InvoiceServices {
  FlutterSecureStorage _secureStorage = FlutterSecureStorage();
  final baseUrl = 'https://www.api.viknbooks.com/api/v10/sales/sale-list-page/';
  Dio dio = Dio();
  final payload = {
    "BranchID": 1,
    "CompanyID": "1901b825-fe6f-418d-b5f0-7223d0040d08",
    "CreatedUserID": 61,
    "Date": "2024",
    "PriceRounding": 1,
    "page_no": 1,
    "items_per_page": 30,
    "type": "Sales",
    "WarehouseID": 1
  };

  Future<List<invoices>?> salesPage() async {
    final token = await _secureStorage.read(key: 'access');
    var headers = {'Authorization': 'Bearer $token'};
    try {
      final response = await dio.post(baseUrl,
          data: payload,
          options: Options(
            headers: headers,
          ));
      if (response.statusCode == 200) {
        log(response.data.toString());
      }
    }on DioException catch (e) {
      log(e.message.toString());
    }
  }
}
