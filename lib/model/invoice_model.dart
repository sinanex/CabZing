class invoices {
  int? statusCode;
  List<Data>? data;


  invoices({this.statusCode, this.data});

  invoices.fromJson(Map<String, dynamic> json) {
    statusCode = json['StatusCode'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add( Data.fromJson(v));
      });
    }
  }
}

class Data {
  int? index;
  String? id;
  String? voucherNo;
  String? date;
  String? ledgerName;
  double? totalGrossAmtRounded;
  double? totalTaxRounded;
  double? grandTotalRounded;
  String? customerName;
  double? totalTax;
  String? status;
  double? grandTotal;
  bool? isBillwised;
  String? billwiseStatus;

  Data(
      {this.index,
      this.id,
      this.voucherNo,
      this.date,
      this.ledgerName,
      this.totalGrossAmtRounded,
      this.totalTaxRounded,
      this.grandTotalRounded,
      this.customerName,
      this.totalTax,
      this.status,
      this.grandTotal,
      this.isBillwised,
      this.billwiseStatus});

  Data.fromJson(Map<String, dynamic> json) {
    index = json['index'];
    id = json['id'];
    voucherNo = json['VoucherNo'];
    date = json['Date'];
    ledgerName = json['LedgerName'];
    totalGrossAmtRounded = json['TotalGrossAmt_rounded'];
    totalTaxRounded = json['TotalTax_rounded'];
    grandTotalRounded = json['GrandTotal_Rounded'];
    customerName = json['CustomerName'];
    totalTax = json['TotalTax'];
    status = json['Status'];
    grandTotal = json['GrandTotal'];
    isBillwised = json['is_billwised'];
    billwiseStatus = json['billwise_status'];
  }

}