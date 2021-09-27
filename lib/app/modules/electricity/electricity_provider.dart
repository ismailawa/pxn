class ElectricityProvider {
  final String serviceType;
  final String shortname;
  final int billerId;
  final int productId;
  final String name;

  ElectricityProvider({
    this.serviceType,
    this.shortname,
    this.billerId,
    this.productId,
    this.name,
  });

  factory ElectricityProvider.fromJson(Map<String, dynamic> json) =>
      ElectricityProvider(
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

  static List<ElectricityProvider> providersModelParser(dynamic response) =>
      response
          .map<ElectricityProvider>(
              (json) => ElectricityProvider.fromJson(json))
          .toList();
}

// service_type: jos_electric_postpaid, shortname: jos electric postpaid, biller_id: 2, product_id: 2, name: Jos Postpaid