import 'package:flutter/material.dart';
import 'dart:io';

const primaryColor = Color(0xFF1b75bc);
const primaryLightColor = Color(0xFFFFECDF);
const primaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const secondaryColor = Color(0xFF979797);
const textColor = Color(0xFF757575);
const animationDuration = Duration(microseconds: 200);

const base_url = 'https://pxn-backend.herokuapp.com/api/v1';
const login_url = '/auth/login';
const register_url = '/auth/register';
const verify_url = '/auth/otp/verify';
const resendtoken_url = '/auth/otp/resend';
const user_profile_url = '/user-mgt';

// Colors
const kBackgroundColor = Color(0xFFE7EEFB);
const kSidebarBackgroundColor = Color(0xFFF1F4FB);
const kCardPopupBackgroundColor = Color(0xFFF5F8FF);
const kPrimaryLabelColor = Color(0xFF242629);
const kSecondaryLabelColor = Color(0xFF797F8A);
const pxnPrimaryColor = Color(0xFFF6921E);
const pxnSecondaryColor = Color(0xFF1D83AE);
const kShadowColor = Color.fromRGBO(72, 76, 82, 0.16);
const kCourseElementIconColor = Color(0xFF17294D);

// Text Styles
var kLargeTitleStyle = TextStyle(
  fontSize: 28.0,
  fontWeight: FontWeight.bold,
  color: kPrimaryLabelColor,
  fontFamily: Platform.isIOS ? 'SF Pro Text' : 'Lato',
  decoration: TextDecoration.none,
);

var kLargeTitleStyle3 = TextStyle(
  fontSize: 22.0,
  fontWeight: FontWeight.bold,
  color: kPrimaryLabelColor,
  fontFamily: Platform.isIOS ? 'SF Pro Text' : 'Lato',
  decoration: TextDecoration.none,
);
var kLargeTitleStyle2 = TextStyle(
  fontSize: 28.0,
  fontWeight: FontWeight.bold,
  color: Colors.white,
  fontFamily: Platform.isIOS ? 'SF Pro Text' : 'Lato',
  decoration: TextDecoration.none,
);
var kTitle1Style = TextStyle(
  fontSize: 22.0,
  fontWeight: FontWeight.bold,
  color: kPrimaryLabelColor,
  fontFamily: Platform.isIOS ? 'SF Pro Text' : 'Lato',
  decoration: TextDecoration.none,
);
var kCardTitleStyle = TextStyle(
  fontFamily: Platform.isIOS ? 'SF Pro Text' : 'Lato',
  fontWeight: FontWeight.bold,
  color: Colors.white,
  fontSize: 22.0,
  decoration: TextDecoration.none,
);
var kTitle2Style = TextStyle(
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
  color: kPrimaryLabelColor,
  fontFamily: Platform.isIOS ? 'SF Pro Text' : 'Lato',
  decoration: TextDecoration.none,
);
var kHeadlineLabelStyle = TextStyle(
  fontSize: 17.0,
  fontWeight: FontWeight.w800,
  color: kPrimaryLabelColor,
  fontFamily: 'SF Pro Text',
  decoration: TextDecoration.none,
);
var kHeadlineLabelStyle2 = TextStyle(
  fontSize: 22.0,
  fontWeight: FontWeight.w800,
  color: Colors.white,
  fontFamily: 'SF Pro Text',
  decoration: TextDecoration.none,
);
var kSubtitleStyle = TextStyle(
  fontSize: 16.0,
  color: kSecondaryLabelColor,
  fontFamily: Platform.isIOS ? 'SF Pro Text' : 'Lato',
  decoration: TextDecoration.none,
);
var kSubtitleStyle3 = TextStyle(
  fontSize: 20.0,
  color: Colors.white,
  fontFamily: Platform.isIOS ? 'SF Pro Text' : 'Lato',
  decoration: TextDecoration.none,
);

var kSubtitleStyle2 = TextStyle(
  fontSize: 16.0,
  color: Colors.deepOrange,
  fontWeight: FontWeight.w600,
  fontFamily: Platform.isIOS ? 'SF Pro Text' : 'Lato',
  decoration: TextDecoration.none,
);
var kButtonStyle = TextStyle(
  fontSize: 20.0,
  color: Colors.white,
  fontFamily: Platform.isIOS ? 'SF Pro Text' : 'Lato',
  decoration: TextDecoration.none,
);
var kBodyLabelStyle = TextStyle(
  fontSize: 16.0,
  color: Colors.black,
  fontFamily: Platform.isIOS ? 'SF Pro Text' : 'Lato',
  decoration: TextDecoration.none,
);
var kCalloutLabelStyle = TextStyle(
  fontSize: 16.0,
  fontWeight: FontWeight.w800,
  color: kPrimaryLabelColor,
  fontFamily: Platform.isIOS ? 'SF Pro Text' : 'Lato',
  decoration: TextDecoration.none,
);
var kSecondaryCalloutLabelStyle = TextStyle(
  fontSize: 16.0,
  color: kSecondaryLabelColor,
  fontFamily: Platform.isIOS ? 'SF Pro Text' : 'Lato',
  decoration: TextDecoration.none,
);
var kSearchPlaceholderStyle = TextStyle(
  fontSize: 13.0,
  color: kSecondaryLabelColor,
  fontFamily: Platform.isIOS ? 'SF Pro Text' : 'Lato',
  decoration: TextDecoration.none,
);
var kSearchTextStyle = TextStyle(
  fontSize: 18.0,
  color: kPrimaryLabelColor,
  fontWeight: FontWeight.w600,
  fontFamily: Platform.isIOS ? 'SF Pro Text' : 'Lato',
  decoration: TextDecoration.none,
);
var kCardSubtitleStyle = TextStyle(
  fontFamily: Platform.isIOS ? 'SF Pro Text' : 'Lato',
  color: Color(0xE6FFFFFF),
  fontSize: 13.0,
  decoration: TextDecoration.none,
);
var kCaptionLabelStyle = TextStyle(
  fontSize: 12.0,
  color: kSecondaryLabelColor,
  fontFamily: Platform.isIOS ? 'SF Pro Text' : 'Lato',
  decoration: TextDecoration.none,
);
