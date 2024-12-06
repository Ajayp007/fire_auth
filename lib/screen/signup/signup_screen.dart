import 'package:email_validator/email_validator.dart';
import 'package:fire_auth/screen/home/controller/home_controller.dart';
import 'package:fire_auth/screen/home/model/home_model.dart';
import 'package:fire_auth/utils/helper/fireauth_helper.dart';
import 'package:fire_auth/utils/helper/firedb_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtName = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  bool passwordVisible = false;
  HomeController controller = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
    controller.getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Image.asset(
                    "assets/logo/Login-pana (1).png",
                    height: 300,
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    controller: txtName,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        fillColor: Colors.grey,
                        labelText: "Name"),
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    controller: txtEmail,
                    validator: (value) => EmailValidator.validate(value!)
                        ? null
                        : "Please enter a valid email",
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        fillColor: Colors.grey,
                        labelText: "Email"),
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    textInputAction: TextInputAction.done,
                    controller: txtPassword,
                    obscureText: passwordVisible,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter Password";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              passwordVisible = !passwordVisible;
                            });
                          },
                          icon: Icon(passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        fillColor: Colors.grey,
                        labelText: "Password"),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    child: MaterialButton(
                      textColor: Colors.white,
                      height: 40,
                      color: const Color(0xff084759),
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          await FireAuthHelper.helper
                              .signUpAuth(txtEmail.text, txtPassword.text);
                          HomeModel model = HomeModel(
                              userName: txtName.text, userEmail: txtEmail.text);
                          FireAuthHelper.helper.checkUser();
                          FirebaseDBHelper.helper.getUser(model);
                          Get.back();
                        }
                      },
                      child: const Text("Sign Up"),
                    ),
                  ),
                  const SizedBox(height: 30),
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: "Already have an account?",
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          ),
                          TextSpan(
                            text: " Sign In",
                            style: TextStyle(
                                color: Color(0xff084759),
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
