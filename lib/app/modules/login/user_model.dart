import 'package:pxn_mobile/app/modules/login/transaction_model.dart';
import 'package:pxn_mobile/app/modules/login/wallet.dart';

class User {
  int id;
  String firstname;
  String lastname;
  String fullname;
  String username;
  String email;
  String phone;
  String avatar;
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
  Wallet wallet;
  List<TransactionModel> transactions;

  User({
    this.id,
    this.firstname,
    this.lastname,
    this.fullname,
    this.username,
    this.email,
    this.phone,
    this.avatar,
    this.role,
    this.password,
    this.isPhoneVerified,
    this.isBvnVerified,
    this.phoneVerificationOtp,
    this.otpExpires,
    this.passwordResetToken,
    this.tokenExpiresIn,
    this.createdAt,
    this.updatedAt,
    this.wallet,
    this.transactions,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        firstname: json['firstname'],
        lastname: json['lastname'],
        fullname: json['fullname'],
        username: json['username'],
        email: json['email'],
        phone: json['phone'],
        role: json['role'],
        avatar: json['avatar'],
        password: json['password'],
        isPhoneVerified: json['isPhoneVerified'],
        isBvnVerified: json['isBvnVerified'],
        phoneVerificationOtp: json['phoneVerificationOtp'],
        otpExpires: json['otpExpires'],
        passwordResetToken: json['passwordResetToken'],
        tokenExpiresIn: json['tokenExpiresIn'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt'],
        wallet: Wallet.fromJson(json['Wallet']),
        transactions:
            TransactionModel.transactionJsonListParser(json['transactions']),
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
    data['avatar'] = avatar;
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
    data['wallet'] = wallet.toJson();
    return data;
  }
}
