class Product {
  final int id;
  final String title;
  final String description;
  final int quantity;
  final double price;
  final List<String> images;

  Product({
    this.id,
    this.title,
    this.description,
    this.quantity,
    this.price,
    this.images,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        quantity: json['quantity'],
        price: json['price'],
        images: json['images'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'quantity': quantity,
        'price': price,
        'images': images
      };
}
