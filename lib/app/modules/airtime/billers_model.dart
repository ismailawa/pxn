class BillersModel {
  final String serviceType;
  final String shortname;
  final int billerId;
  final int productId;
  final String name;
  final List<dynamic> plan;

  BillersModel({
    this.serviceType,
    this.shortname,
    this.billerId,
    this.productId,
    this.name,
    this.plan,
  });

  factory BillersModel.fromJson(Map<String, dynamic> json) => BillersModel(
        serviceType: json['service_type'],
        shortname: json['shortname'],
        billerId: json['biller_id'],
        productId: json['product_id'],
        name: json['name'],
        plan: json['plan'],
      );

  Map<String, dynamic> toJson() => {
        'service_type': serviceType,
        'shortname': shortname,
        'biller_id': billerId,
        'product_id': productId,
        'name': name,
        'plan': plan,
      };

  static List<BillersModel> billersModelParser(dynamic response) => response
      .map<BillersModel>((json) => BillersModel.fromJson(json))
      .toList();
}
