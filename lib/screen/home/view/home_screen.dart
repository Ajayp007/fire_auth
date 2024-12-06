import 'package:fire_auth/screen/home/controller/home_controller.dart';
import 'package:fire_auth/utils/helper/fireauth_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController controller = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    controller.getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notes"),
        centerTitle: true,
        backgroundColor: Colors.yellow.shade200,
      ),
      drawer: Drawer(
        child: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 50, left: 12),
                alignment: Alignment.topLeft,
                height: MediaQuery.sizeOf(context).height * 0.16,
                width: MediaQuery.sizeOf(context).width,
                color: Colors.yellow.shade200,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          "${controller.model.value.userName}",
                          style: const TextStyle(
                              color: Colors.black, fontSize: 20),
                        ),
                        Text(
                          "${controller.model.value.userEmail}",
                          style: const TextStyle(
                              color: Colors.black, fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ListTile(
                onTap: () async {
                  await FireAuthHelper.helper.signOutAuth();
                  Get.toNamed('si');
                },
                title: const Text(
                  "Sign Out ?",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                trailing: const Icon(Icons.exit_to_app_outlined),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow.shade200,
        child: const Icon(Icons.add),
        onPressed: () {
          Get.toNamed('add');
        },
      ),
    );
  }
}
