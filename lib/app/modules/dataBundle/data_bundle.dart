class DataBundle {
  final String name;
  final String allowance;
  final double price;
  final String validity;
  final int datacode;

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
        price: json['price'],
        validity: json['validity'],
        datacode: json['datacode'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'allowance': allowance,
        'price': price,
        'validity': validity,
        'datacode': datacode,
      };

  List<DataBundle> dataBundleParser(dynamic response) =>
      response.map<DataBundle>((json) => DataBundle.fromJson(json)).toList();
}
