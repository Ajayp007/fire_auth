import 'package:fire_auth/screen/signin/view/signin_screen.dart';
import 'package:fire_auth/screen/signup/signup_screen.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> app_routes = {
  '/': (a) => const SigninScreen(),
  'up': (a) => const SignUpScreen(),
};
