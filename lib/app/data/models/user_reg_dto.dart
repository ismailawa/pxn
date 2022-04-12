class UserRegDto {
  final String fullname;

  final String phone;
  final String email;
  final String password;

  UserRegDto({
    this.fullname,
    this.phone,
    this.email,
    this.password,
  });

  factory UserRegDto.fromJson(Map<String, dynamic> json) => UserRegDto(
        fullname: json['firstname'],
        phone: json['phone'],
        email: json['email'],
        password: json['password'],
      );

  Map<String, dynamic> toMap() => {
        'fullname': fullname,
        'phone': phone,
        'email': email,
        'password': password,
      };
}
