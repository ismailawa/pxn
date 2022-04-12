class Category {
  String id;
  String name;

  Category({
    this.id,
    this.name,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json['_id'],
        name: json['categoryName'],
      );

  Map<String, dynamic> toMap() => {
        '_id': id,
        'categoryName': name,
      };

  static List<Category> categoriesModelParser(dynamic response) =>
      response.map<Category>((json) => Category.fromJson(json)).toList();
}
