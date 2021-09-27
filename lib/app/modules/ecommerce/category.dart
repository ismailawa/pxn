import 'package:pxn_mobile/app/modules/ecommerce/subCategory.dart';

class Category {
  final int id;
  final String name;
  final String description;
  final bool hasSubcategory;
  final List<SubCategory> subcategories;

  Category({
    this.id,
    this.name,
    this.description,
    this.hasSubcategory,
    this.subcategories,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        hasSubcategory: json['hasSubcategory'],
        subcategories:
            SubCategory.subCategoriesModelParser(json['subcategories']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'hasSubcategory': hasSubcategory,
        'subcategories': subcategories
      };

  static List<Category> categoriesModelParser(dynamic response) =>
      response.map<Category>((json) => Category.fromJson(json)).toList();
}
