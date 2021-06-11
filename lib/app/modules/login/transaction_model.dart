import 'dart:convert';

class TransactionModel {
  final int id;
  final String type;
  final String description;
  final double amount;
  final String genus;
  final String date;

  TransactionModel({
    this.id,
    this.type,
    this.description,
    this.amount,
    this.genus,
    this.date,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      TransactionModel(
        id: json['id'],
        type: json['type'],
        description: json['description'],
        amount: json['amount'].toDouble(),
        genus: json['genus'],
        date: json['date'],
      );

  static List<TransactionModel> transactionJsonListParser(dynamic response) =>
      response
          .map<TransactionModel>((json) => TransactionModel.fromJson(json))
          .toList();
}
