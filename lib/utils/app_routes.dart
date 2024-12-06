import 'package:fire_auth/screen/adddata/view/adddata_screen.dart';
import 'package:fire_auth/screen/home/view/home_screen.dart';
import 'package:fire_auth/screen/signin/view/signin_screen.dart';
import 'package:fire_auth/screen/signup/signup_screen.dart';
import 'package:fire_auth/screen/splash/view/splash_screen.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> app_routes = {
  '/': (a) => const SplashScreen(),
  'si': (a) => const SigninScreen(),
  'up': (a) => const SignupScreen(),
  'home': (a) => const HomeScreen(),
  'add': (a) => const AddDataScreen()
};
