class UserRegDto {
  final String firstname;
  final String lastname;
  final String username;
  final String phone;
  final String email;
  final String password;
  final String role;

  UserRegDto(
      {this.firstname,
      this.lastname,
      this.username,
      this.phone,
      this.email,
      this.password,
      this.role});

  factory UserRegDto.fromJson(Map<String, dynamic> json) => UserRegDto(
      firstname: json['firstname'],
      lastname: json['lastname'],
      username: json['username'],
      phone: json['phone'],
      email: json['email'],
      password: json['password'],
      role: json['role']);

  Map<String, dynamic> toMap() => {
        'firstname': firstname,
        'lastname': lastname,
        'username': username,
        'phone': phone,
        'email': email,
        'password': password,
        'role': role,
      };
}
