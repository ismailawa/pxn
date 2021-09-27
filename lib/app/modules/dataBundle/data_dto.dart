class DataDto {
  final String phone;
  final double amount;
  final String serviceType;
  final dynamic datacode;

  DataDto({
    this.phone,
    this.amount,
    this.serviceType,
    this.datacode,
  });

  Map<String, dynamic> toJson() => {
        'phone': phone,
        'amount': amount,
        'service_type': serviceType,
        'datacode': datacode,
      };
}
