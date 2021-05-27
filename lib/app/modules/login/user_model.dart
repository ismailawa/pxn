class User {
  int id;
  String firstname;
  String lastname;
  String fullname;
  String username;
  String email;
  String phone;
  String role;
  String password;
  bool isPhoneVerified;
  bool isBvnVerified;
  dynamic phoneVerificationOtp;
  dynamic otpExpires;
  dynamic passwordResetToken;
  dynamic tokenExpiresIn;
  String createdAt;
  String updatedAt;

  User(
      {this.id,
      this.firstname,
      this.lastname,
      this.fullname,
      this.username,
      this.email,
      this.phone,
      this.role,
      this.password,
      this.isPhoneVerified,
      this.isBvnVerified,
      this.phoneVerificationOtp,
      this.otpExpires,
      this.passwordResetToken,
      this.tokenExpiresIn,
      this.createdAt,
      this.updatedAt});

  factory User.fromJson(Map<String, dynamic> json) => User(
        id :json['id'],
    firstname : json['firstname'],
    lastname : json['lastname'],
    fullname : json['fullname'],
    username :json['username'],
    email : json['email'],
    phone : json['phone'],
    role : json['role'],
    password : json['password'],
    isPhoneVerified : json['isPhoneVerified'],
    isBvnVerified : json['isBvnVerified'],
    phoneVerificationOtp : json['phoneVerificationOtp'],
    otpExpires : json['otpExpires'],
    passwordResetToken : json['passwordResetToken'],
    tokenExpiresIn : json['tokenExpiresIn'],
    createdAt : json['createdAt'],
    updatedAt : json['updatedAt'],
  );

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['firstname'] = firstname;
    data['lastname'] = lastname;
    data['fullname'] = fullname;
    data['username'] = username;
    data['email'] = email;
    data['phone'] = phone;
    data['role'] = role;
    data['password'] = password;
    data['isPhoneVerified'] = isPhoneVerified;
    data['isBvnVerified'] = isBvnVerified;
    data['phoneVerificationOtp'] = phoneVerificationOtp;
    data['otpExpires'] = otpExpires;
    data['passwordResetToken'] = passwordResetToken;
    data['tokenExpiresIn'] = tokenExpiresIn;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
