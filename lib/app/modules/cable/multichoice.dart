class Multichoice {
  final int monthsPaidFor;
  final double price;
  final int invoicePeriod;

  Multichoice({
    this.monthsPaidFor,
    this.price,
    this.invoicePeriod,
  });

  factory Multichoice.fromMap(Map<String, dynamic> map) => Multichoice(
        monthsPaidFor: map["monthsPaPaidFor"],
        price: (map["price"] as int).toDouble(),
        invoicePeriod: map["invoicePeriod"],
      );

  static List<Multichoice> multichoiceModelParser(dynamic response) =>
      response.map<Multichoice>((json) => Multichoice.fromMap(json)).toList();
}
