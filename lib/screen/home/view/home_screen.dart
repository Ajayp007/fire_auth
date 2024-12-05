import 'package:fire_auth/utils/helper/fireauth_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hello"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await FireAuthHelper.helper.signOutAuth();
            Get.toNamed('si');
          },
          child: const Text("Sign Out"),
        ),
      ),
    );
  }
}
