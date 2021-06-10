class FlutterWaveInitResponseModel {
  final bool success;
  final FWIReponseData data;

  FlutterWaveInitResponseModel({this.success, this.data});

  factory FlutterWaveInitResponseModel.fromJson(Map<String, dynamic> json) =>
      FlutterWaveInitResponseModel(
        success: json['success'],
        data: FWIReponseData.fromJson(json['data']),
      );
}

class FWIReponseData {
  final String txtRef;
  final double amount;
  final String flwpubk;
  final String flwenckey;

  FWIReponseData({
    this.txtRef,
    this.amount,
    this.flwpubk,
    this.flwenckey,
  });

  factory FWIReponseData.fromJson(Map<String, dynamic> json) => FWIReponseData(
        txtRef: json['tx_ref'],
        amount: json['amount'].toDouble(),
        flwpubk: json['flwpubk'],
        flwenckey: json['flwenckey'],
      );
}
