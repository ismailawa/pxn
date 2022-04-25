import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';

class InitialMiddleware extends GetMiddleware {
  final localStorage = GetStorage();
  @override
  redirect(String route) {
    return localStorage.read('initial') == null
        ? null
        : RouteSettings(name: '/dashboard');
  }
}