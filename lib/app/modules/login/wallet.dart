class Wallet {
  final int id;
  final int balance;

  Wallet({this.id, this.balance});

  factory Wallet.fromJson(Map<String, dynamic> json) =>
      Wallet(id: json['id'], balance: json['balance']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'balance': balance,
      };
}
