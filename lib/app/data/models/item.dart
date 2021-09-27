import 'package:pxn_mobile/app/modules/ecommerce/product.dart';

class Item {
  final int id;
  final int quantity;
  final double totalPrice;
  final Product productDetails;

  Item({
    this.id,
    this.quantity,
    this.totalPrice,
    this.productDetails,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json['id'],
        quantity: json['quantity'],
        totalPrice: (json['totalPrice'] as int).toDouble(),
        productDetails: Product.fromJson(json['productDetails']),
      );

  static List<Item> categoriesModelParser(dynamic response) =>
      response.map<Item>((json) => Item.fromJson(json)).toList();
}
