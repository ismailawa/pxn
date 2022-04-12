import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';

class AuthMiddleware extends GetMiddleware {
  final localStorage = GetStorage();
  @override
  redirect(String route) {
    return localStorage.read('isLogin') != null
        ? localStorage.read('isLogin')
            ? localStorage.read('user')['addAddress'].length > 0
                ? null
                : RouteSettings(name: '/add-shipping-address')
            : RouteSettings(name: '/login')
        : RouteSettings(name: '/login');
  }
}
