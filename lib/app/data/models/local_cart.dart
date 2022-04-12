import 'package:pxn_mobile/app/data/models/product.dart';

class LocalCart {
  String id;
  Product product;
  int quantity;

  LocalCart({
    this.id,
    this.product,
    this.quantity,
  });

  factory LocalCart.fromJson(Map<String, dynamic> json) => LocalCart(
        id: json['id'],
        product: Product.fromJson(json['product']),
        quantity: json['quantity'],
      );
  Map<String, dynamic> toJson() => {
        'id': id,
        'product': product.toMap(),
        'quantity': quantity,
      };
}
