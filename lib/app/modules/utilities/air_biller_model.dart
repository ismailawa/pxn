class AirBillerModel {
  final String serviceType;
  final String shortname;
  final int billerId;
  final int productId;
  final String name;
  final List<String> plan;

  AirBillerModel({
    this.serviceType,
    this.shortname,
    this.billerId,
    this.productId,
    this.name,
    this.plan,
  });

  factory AirBillerModel.fromJson(Map<String, dynamic> json) => AirBillerModel(
        serviceType: json['service_type'],
        shortname: json['shortname'],
        billerId: json['biller_id'],
        productId: json['product_id'],
        name: json['name'],
        plan: json['plan'],
      );

  Map<String, dynamic> toMap() => {
        'service_type': serviceType,
        'shortname': shortname,
        'biller_id': billerId,
        'product_id': productId,
        'name': name,
        'plan': plan,
      };

  static List<AirBillerModel> airBillerModelParser(dynamic response) => response
      .map<AirBillerModel>((res) => AirBillerModel.fromJson(res))
      .toList();
}
