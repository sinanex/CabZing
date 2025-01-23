import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:vikncodes/model/invoice_model.dart';
import 'package:vikncodes/services/invoices/invoice_services.dart';

class SaleController extends ChangeNotifier {
  List<Data> saleList = [];
  List<Data> filteredSaleList = [];
  final InvoiceServices _invoiceServices = InvoiceServices();

  Future<void> getSaleData() async {
    saleList = await _invoiceServices.salesPage();
    filteredSaleList = saleList;
    if (saleList.isNotEmpty) {
      log('Sale data fetch success');
    }
    notifyListeners();
  }

  void searchList(String query) {
    if (query.isEmpty) {
      filteredSaleList = saleList;
    } else {
      filteredSaleList = saleList.where((data) {
        final customerName = data.customerName?.toLowerCase() ?? '';
        final voucherNo = data.voucherNo?.toLowerCase() ?? '';
        return customerName.contains(query.toLowerCase()) ||
            voucherNo.contains(query.toLowerCase());
      }).toList();
    }
    notifyListeners();
  }
}
