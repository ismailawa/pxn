class DataBundle {
  final String name;
  final String allowance;
  final double price;
  final String validity;
  final dynamic datacode;

  DataBundle({
    this.name,
    this.allowance,
    this.price,
    this.validity,
    this.datacode,
  });

  factory DataBundle.fromJson(Map<String, dynamic> json) => DataBundle(
        name: json['name'],
        allowance: json['allowance'],
        price: (json['price'] as int).toDouble(),
        validity: json['validity'],
        datacode: json['datacode'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'allowance': allowance,
        'price': price,
        'validity': validity,
        "datacode": datacode,
      };

  static List<DataBundle> dataBundleParser(dynamic response) =>
      response.map<DataBundle>((json) => DataBundle.fromJson(json)).toList();
}
