import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/core/routes/app_routes.dart';

class AuthMiddleWare extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    var currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      return const RouteSettings(name: AppRoutes.rHomeScreen);
    }
  }
}
