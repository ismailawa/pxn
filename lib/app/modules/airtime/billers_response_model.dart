import 'package:pxn_mobile/app/modules/airtime/billers_model.dart';

class BillersresponseModel {
  final String status;
  final String message;
  final List<BillersModel> provider;

  BillersresponseModel({
    this.status,
    this.message,
    this.provider,
  });

  factory BillersresponseModel.fromJson(Map<String, dynamic> json) =>
      BillersresponseModel(
        status: json['status'],
        message: json['message'],
        provider: BillersModel.billersModelParser(json['data']['providers']),
      );
}
