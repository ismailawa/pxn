class Wallet {
  final int id;
  final double balance;

  Wallet({this.id, this.balance});

  factory Wallet.fromJson(Map<String, dynamic> json) => Wallet(
      id: json['id'],
      balance: json['balance'].runtimeType == int
          ? json['balance'].toDouble()
          : json['balance']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'balance': balance,
      };
}
