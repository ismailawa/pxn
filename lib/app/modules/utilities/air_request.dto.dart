class AirRequestDto {
  final String phone;
  final double amount;
  final String serviceType;

  AirRequestDto({this.phone, this.amount, this.serviceType});

  factory AirRequestDto.fromJson(Map<String, dynamic> json) => AirRequestDto(
        phone: json['phone'],
        amount: json['amount'],
        serviceType: json['service_type'],
      );

  Map<String, dynamic> toMap() => {
        'phone': phone,
        'amount': amount,
        'service_type': serviceType,
      };
}
