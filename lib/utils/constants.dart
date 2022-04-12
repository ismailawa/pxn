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

const base_url = 'https://nascodirect.net/api';
const login_url = '/user/login';
const register_url = '/user/register';
const products_url = '/product';
const categories_url = '/category';
const get_order_by_email_url = '/order/orderEmail?email=';
const get_user_url = '/auth/register';
const verify_url = '/user-mgt/';
const resendtoken_url = '/auth/otp/resend';
const user_profile_url = '/user-mgt';
const payment_initialisation_url = '/wallet/credit';
const payment_confirmation_url = '/wallet/confirmation';
const air_biller_url = '/utility/services/airtime/billers';
const air_request_url = '/utility/services/airtime/request';
const user_wallet_confirmation_url = '/wallet/check?username=';
const wallet_transfer_url = '/wallet/transfer';
const data_providers_url = '/utility/services/databundle/providers';
const data_bundles_url = '/utility/services/databundle/bundles';
const cable_providers_url = '/utility/services/cabletv/providers';
const verify_cable_account_url = '/utility/services/cabletv/verify-account';
const get_multichoice_list_cable = '/utility/services/cabletv/multichoice-lis';
const get_addons_list_cable = '/utility/services/cabletv/multichoice-addons';
const request_cable_tv = '/utility/services/cabletv/request';
const purcharce_data_bundles_url = '/utility/services/databundle/request';
const get_electricity_provider_url = '/utility/services/electricity/providers';
const verify_electricity_account_url =
    '/utility/services/electricity/verify-account';
const purchase_electricity_account_url =
    '/utility/services/electricity/request';
const ecommerce_categories_url = '/product/category/all';
const ecommerce_products_url = '/store/product/all';
const add_to_cart_url = '/cart/add-to-cart';
const create_order_url = '/order';
const review_url = '/review/';
const get_cart_url = '/user/cart';
const checkout_cart_url = '/user/cart/checkout/';
const dec_inc_item_cart_url = '/user/cart/';
const remove_item_cart_url = '/user/cart/remove/';
const add_shoping_address_url = '/address';
const get_orders_url = '/order/';
const get_cable_providers = '/utility/services/cabletv/providers';
const verify_cable_account = '/utility/services/cabletv/verify-account';
const get_multi_choice_list = '/utility/services/cabletv/multichoice-list';
const get_multi_choice_addon = '/utility/services/cabletv/multichoice-addons';
const purchase_multi_choice_tv = '/utility/services/cabletv/request';
const transaction_data_history = '/utility/transaction/airtime-data/history/';
const transaction_electricity_history =
    '/utility/transaction/electricity/history/';
const transaction_cable_history = '/utility/transaction/cable/history/';
const transaction_wallet_history = '/wallet/transaction/history/';

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
  fontFamily: Platform.isIOS ? 'SF Pro Text' : 'Roboto',
  decoration: TextDecoration.none,
);

var kLargeTitleStyle3 = TextStyle(
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
  color: kPrimaryLabelColor.withOpacity(0.8),
  fontFamily: Platform.isIOS ? 'SF Pro Text' : 'Roboto',
  decoration: TextDecoration.none,
);
var kLargeTitleStyle2 = TextStyle(
  fontSize: 28.0,
  fontWeight: FontWeight.bold,
  color: Colors.white,
  fontFamily: Platform.isIOS ? 'SF Pro Text' : 'Roboto',
  decoration: TextDecoration.none,
);
var kTitle1Style = TextStyle(
  fontSize: 22.0,
  fontWeight: FontWeight.bold,
  color: kPrimaryLabelColor,
  fontFamily: Platform.isIOS ? 'SF Pro Text' : 'Roboto',
  decoration: TextDecoration.none,
);
var kCardTitleStyle = TextStyle(
  fontFamily: Platform.isIOS ? 'SF Pro Text' : 'Roboto',
  fontWeight: FontWeight.bold,
  color: Colors.white,
  fontSize: 22.0,
  decoration: TextDecoration.none,
);
var kTitle2Style = TextStyle(
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
  color: kPrimaryLabelColor,
  fontFamily: Platform.isIOS ? 'SF Pro Text' : 'Roboto',
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
  color: Colors.white.withOpacity(0.85),
  fontFamily: 'SF Pro Text',
  decoration: TextDecoration.none,
);
var kSubtitleStyle = TextStyle(
  fontSize: 16.0,
  color: kSecondaryLabelColor,
  fontFamily: Platform.isIOS ? 'SF Pro Text' : 'Roboto',
  decoration: TextDecoration.none,
);
var kSubtitleStyle3 = TextStyle(
  fontSize: 20.0,
  color: Colors.white,
  fontFamily: Platform.isIOS ? 'SF Pro Text' : 'Roboto',
  decoration: TextDecoration.none,
);

var kSubtitleStyle2 = TextStyle(
  fontSize: 16.0,
  color: Colors.deepOrange,
  fontWeight: FontWeight.w600,
  fontFamily: Platform.isIOS ? 'SF Pro Text' : 'Roboto',
  decoration: TextDecoration.none,
);
var kButtonStyle = TextStyle(
  fontSize: 20.0,
  color: Colors.white,
  fontFamily: Platform.isIOS ? 'SF Pro Text' : 'Roboto',
  decoration: TextDecoration.none,
);
var kBodyLabelStyle = TextStyle(
  fontSize: 16.0,
  color: Colors.black,
  fontFamily: Platform.isIOS ? 'SF Pro Text' : 'Roboto',
  decoration: TextDecoration.none,
);
var kCalloutLabelStyle = TextStyle(
  fontSize: 16.0,
  fontWeight: FontWeight.w800,
  color: kPrimaryLabelColor,
  fontFamily: Platform.isIOS ? 'SF Pro Text' : 'Roboto',
  decoration: TextDecoration.none,
);
var kSecondaryCalloutLabelStyle = TextStyle(
  fontSize: 16.0,
  color: kSecondaryLabelColor,
  fontFamily: Platform.isIOS ? 'SF Pro Text' : 'Roboto',
  decoration: TextDecoration.none,
);
var kSearchPlaceholderStyle = TextStyle(
  fontSize: 13.0,
  color: kSecondaryLabelColor,
  fontFamily: Platform.isIOS ? 'SF Pro Text' : 'Roboto',
  decoration: TextDecoration.none,
);
var kSearchTextStyle = TextStyle(
  fontSize: 18.0,
  color: kPrimaryLabelColor,
  fontWeight: FontWeight.w600,
  fontFamily: Platform.isIOS ? 'SF Pro Text' : 'Roboto',
  decoration: TextDecoration.none,
);
var kCardSubtitleStyle = TextStyle(
  fontFamily: Platform.isIOS ? 'SF Pro Text' : 'Roboto',
  color: Color(0xE6FFFFFF),
  fontSize: 13.0,
  decoration: TextDecoration.none,
);
var kCaptionLabelStyle = TextStyle(
  fontSize: 12.0,
  color: kSecondaryLabelColor,
  fontFamily: Platform.isIOS ? 'SF Pro Text' : 'Roboto',
  decoration: TextDecoration.none,
);
