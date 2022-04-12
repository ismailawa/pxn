import 'package:pxn_mobile/app/data/models/item.dart';

class Cart {
  final int session;
  final int cartTotal;
  final List<Item> items;

  Cart({
    this.session,
    this.cartTotal,
    this.items,
  });

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        session: json['session'] == null ? null : json['session'],
        cartTotal: json['cartTotal'],
        items: Item.categoriesModelParser(json['items']),
      );

  static List<Cart> categoriesModelParser(dynamic response) =>
      response.map<Cart>((json) => Cart.fromJson(json)).toList();
}
