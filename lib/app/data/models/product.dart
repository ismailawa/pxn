import 'package:pxn_mobile/app/data/models/category.dart';
import 'package:pxn_mobile/app/data/models/review.dart';

class Product {
  String id;
  String name;
  String description;
  int price;
  List<String> likes;
  bool isActive;
  List<String> images;
  List<Review> reviews;
  int quantity;
  Category category;
  int discount;
  List<int> comparePrice;

  Product({
    this.id,
    this.name,
    this.description,
    this.price,
    this.likes,
    this.isActive,
    this.images,
    this.reviews,
    this.quantity,
    this.category,
    this.discount,
    this.comparePrice,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['_id'],
        name: json['name'],
        description: json['description'],
        price: json['price'],
        likes: List<String>.from(json['likes'].map((x) => x)),
        isActive: json['isActive'],
        images: List<String>.from(json['image'].map((x) => x)),
        reviews: List<Review>.from(
            json['review'].map<Review>((x) => Review.fromJson(x))),
        quantity: json['quantity'],
        category: json['category'] == null
            ? null
            : Category.fromJson(json['category']),
        discount: json['discount'],
        comparePrice: List<int>.from(json['comparePrice'].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        '_id': id,
        'name': name,
        'description': description,
        'price': price,
        'likes': List<dynamic>.from(likes.map((x) => x)),
        'isActive': isActive,
        'image': List<dynamic>.from(images.map((x) => x)),
        'review': List<dynamic>.from(reviews.map((x) => x.toJson())),
        'quantity': quantity,
        'category': category == null ? null : category.toMap(),
        'discount': discount,
        'comparePrice': List<dynamic>.from(comparePrice.map((x) => x)),
      };

  static List<Product> productModelParser(dynamic response) =>
      response.map<Product>((json) => Product.fromJson(json)).toList();
}
