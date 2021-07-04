class ProviderModel {
  final String serviceType;
  final String shortname;
  final int billerId;
  final int productId;
  final String name;

  ProviderModel({
    this.serviceType,
    this.shortname,
    this.billerId,
    this.productId,
    this.name,
  });

  factory ProviderModel.fromJson(Map<String, dynamic> json) => ProviderModel(
        serviceType: json['service_type'],
        shortname: json['shortname'],
        billerId: json['biller_id'],
        productId: json['product_id'],
        name: json['name'],
      );

  Map<String, dynamic> toJson() => {
        'service_type': serviceType,
        'shortname': shortname,
        'biller_id': billerId,
        'product_id': productId,
        'name': name,
      };

  static List<ProviderModel> billersModelParser(dynamic response) => response
      .map<ProviderModel>((json) => ProviderModel.fromJson(json))
      .toList();
}
