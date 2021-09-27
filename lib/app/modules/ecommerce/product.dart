import 'package:pxn_mobile/app/modules/ecommerce/vendor.dart';

class Product {
  final int id;
  final String name;
  final String description;
  final dynamic sku;
  final int quantity;
  final double price;
  final String image;
  final Map<String, dynamic> vendor;
  final Map<String, dynamic> productCategory;
  final Map<String, dynamic> productSubcategory;
  final Map<String, dynamic> productDiscount;

  Product({
    this.id,
    this.name,
    this.description,
    this.sku,
    this.quantity,
    this.price,
    this.image,
    this.vendor,
    this.productCategory,
    this.productSubcategory,
    this.productDiscount,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        sku: json['sku'],
        quantity: json['quantity'],
        price: (json['price'] as int).toDouble(),
        image: json['image'],
        vendor: json['vendor'],
        productCategory: json['productCategory'],
        productSubcategory: json['productSubcategory'],
        productDiscount: json['productDiscount'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'sku': sku,
        'quantity': quantity,
        'price': price,
        'image': image,
        'vendor': vendor,
        'productCategory': productCategory,
        'productSubcategory': productSubcategory,
        'productDiscount': productDiscount,
      };

  static List<Product> productsModelParser(dynamic response) =>
      response.map<Product>((json) => Product.fromJson(json)).toList();
}
