import 'package:ecom_admin/insert_product.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../common_screen/Comman_Container.dart';
import '../common_screen/Comman_TeextFiled.dart';
import '../common_screen/Comman_text.dart';
import '../email authantication/EmailAuthService.dart';

class Sign_Up extends StatefulWidget {
  const Sign_Up({Key? key}) : super(key: key);

  @override
  State<Sign_Up> createState() => _Sign_UpState();
}

class _Sign_UpState extends State<Sign_Up> with SingleTickerProviderStateMixin {
  final Email_controler = TextEditingController();
  final usernamecontroler = TextEditingController();
  final Password_controler = TextEditingController();
  int selected = 0;
  List name = [
    'Sign Up',
    'Sign In',
  ];
  TabController? tabController;
  final gloablekey = GlobalKey<FormState>();
  List tabItem = [
    "Sign Up",
    "Sign In",
  ];

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Form(
        key: gloablekey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 17,
            ),
            Comman_TexxtFiled(
              filled: true,
              fillcolor: Colors.grey.shade200,
              disableborder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              focouseborder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              FocusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              controller: usernamecontroler,
              hinttext: "Enter Name",
              validator: (value) {
                if (value!.isEmpty) {
                  return "Enter Name";
                }
              },
              onChanged: (value) {
                setState(() {
                  gloablekey.currentState!.validate();
                });
              },
              sufficicon: usernamecontroler.text.length > 2
                  ? Icon(
                      Icons.check_circle,
                      color: Colors.black,
                    )
                  : SizedBox(),
              prefixicon: Icon(
                Icons.person_outlined,
                size: 20,
                color: Colors.grey,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Comman_TexxtFiled(
              filled: true,
              fillcolor: Colors.grey.shade200,
              disableborder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              focouseborder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              FocusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              controller: Email_controler,
              hinttext: "Enter Email",
              validator: (value) {
                final bool emailValid = RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(value!);

                if (emailValid) {
                  return null;
                } else {
                  return "Please enter valid Email Id";
                }
              },
              onChanged: (value) {
                gloablekey.currentState!.validate();
              },
              sufficicon: Email_controler.text.length == 10
                  ? Icon(
                      Icons.check_circle,
                      color: Colors.black,
                    )
                  : SizedBox(),
              prefixicon: Icon(
                Icons.email,
                size: 20,
                color: Colors.grey,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Comman_TexxtFiled(
              filled: true,
              fillcolor: Colors.grey.shade200,
              disableborder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              focouseborder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              FocusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              controller: Password_controler,
              obscureText: true,
              hinttext: "Enter password",
              validator: (value) {
                final bool passwordValid = RegExp(
                        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                    .hasMatch(value!);

                if (value.isEmpty) {
                  return "Enter Password";
                } else if (passwordValid != true) {
                  return "please enter valid password";
                }
              },
              onChanged: (value) {},
              prefixicon: Icon(
                Icons.lock,
                size: 20,
                color: Colors.grey,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Center(
              child: Comman_Container(
                BorderRadius: BorderRadius.circular(40),
                ontap: () {
                  print("hello");
                  if (gloablekey.currentState!.validate()) {
                    EmailAuthService.SignupUser(
                            email: Email_controler.text,
                            password: Password_controler.text)
                        .then((value) async {
                      if (value != null) {
                        SharedPreferences sh =
                            await SharedPreferences.getInstance();
                        sh
                            .setString('email', Email_controler.text)
                            .then((value) => Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Insert_Product(),
                                )));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content:
                                Text("Email is Alerdy Use by Anthor Account"),
                          ),
                        );
                      }
                    });
                  }
                },
                height: 35,
                width: 140,
                color: Color(0xff95D5B2),
                child: Center(
                  child: Comman_Text(
                    text: "Sign Up",
                    color: Colors.white,
                    fontsize: 16,
                    fontweight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
