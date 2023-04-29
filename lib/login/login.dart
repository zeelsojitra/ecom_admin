import 'package:ecom_admin/common_screen/Comman_Container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../common_screen/Comman_TeextFiled.dart';
import '../common_screen/Comman_text.dart';
import '../common_screen/variable.dart';
import '../insert_product.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final Password_controler = TextEditingController();
  bool passwordcheck = true;
  final gloablekey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: gloablekey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Admin Verification",
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: Get.height * 0.030),
              ),
              SizedBox(height: Get.height * 0.015),
              Text(
                "We need to register your Password before getting started!",
                style: TextStyle(fontSize: Get.height * 0.022),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: Get.height * 0.02),
              Container(
                height: Get.height * 0.07,
                width: Get.width * 0.5,
                child: Comman_TexxtFiled(
                  filled: true,
                  fillcolor: Colors.grey.shade200,
                  controller: Password_controler,
                  obscureText: passwordcheck,
                  sufficicon: IconButton(
                    onPressed: () {
                      setState(() {
                        passwordcheck = !passwordcheck;
                      });
                    },
                    icon: passwordcheck
                        ? Icon(Icons.visibility_off)
                        : Icon(Icons.visibility),
                  ),
                  hinttext: "Enter password",
                  validator: (value) {
                    final bool passwordValid = password.hasMatch(value!);
                    if (value != "NestIn@7076") {
                      return "Inccorrect Password";
                    }
                    if (value.isEmpty) {
                      return "Enter Password";
                    } else if (passwordValid != true) {
                      return "please enter valid password";
                    }
                  },
                  onChanged: (value) {},
                  prefixicon: Icon(
                    Icons.lock,
                    size: Get.height * 0.03,
                    color: grey,
                  ),
                ),
              ),
              SizedBox(
                height: Get.height * 0.1,
              ),
              Comman_Container(
                BorderRadius: BorderRadius.circular(40),
                height: Get.height * 0.05,
                width: Get.width * 0.1,
                color: DarkGreen2,
                ontap: () {
                  print("tap");
                  if (gloablekey.currentState!.validate()) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Insert_Product(),
                        ));
                  }
                },
                child: Center(
                  child: Comman_Text(
                    text: "Login",
                    color: white,
                    fontweight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
