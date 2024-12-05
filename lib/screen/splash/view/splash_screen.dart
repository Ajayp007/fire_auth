import 'dart:async';

import 'package:fire_auth/utils/helper/fireauth_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    bool check = FireAuthHelper.helper.checkUser();

    Timer(
      const Duration(seconds: 3),
      () {
        Get.offAllNamed(check ? 'home' : 'si');
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Image.network(
          "https://t4.ftcdn.net/jpg/04/99/95/03/360_F_499950313_AiEmiy38y66YwZhRAFBS9wck5UIPLnbd.jpg",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
