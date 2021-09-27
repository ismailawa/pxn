class Order {
  final int id;
  final String reference;
  final String createdAt;
  final String status;

  Order({
    this.id,
    this.reference,
    this.createdAt,
    this.status,
  });

  factory Order.fromMap(Map<String, dynamic> json) => Order(
        id: json["id"],
        reference: json["reference"],
        createdAt: json["createdAt"],
        status: json["status"],
      );

  static List<Order> ordersModelParser(dynamic response) =>
      response.map<Order>((json) => Order.fromMap(json)).toList();
}
