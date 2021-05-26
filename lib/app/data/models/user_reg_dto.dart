class UserRegDto {
  final String firstName;
  final String lastName;
  final String username;
  final String phone;
  final String email;
  final String password;
  final String role;

  UserRegDto(
      {this.firstName,
      this.lastName,
      this.username,
      this.phone,
      this.email,
      this.password,
      this.role});

  factory UserRegDto.fromJson(Map<String, dynamic> json) => UserRegDto(
      firstName: json['firstName'],
      lastName: json['lastName'],
      username: json['username'],
      phone: json['phone'],
      email: json['email'],
      password: json['password'],
      role: json['role']);

  Map<String, dynamic> toMap() => {
        'fisrtName': firstName,
        'lastName': lastName,
        'username': username,
        'phone': phone,
        'email': email,
        'password': password,
        'role': role,
      };
}
