import 'package:ecom_admin/insert_product.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../common_screen/Comman_Container.dart';
import '../../common_screen/Comman_text.dart';
import '../getx/controller.dart';
import 'enter_mobile.dart';

class VerifyOtp extends StatefulWidget {
  const VerifyOtp({Key? key}) : super(key: key);

  @override
  State<VerifyOtp> createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {
  String? OTP;
  bool isLoding = false;
  final Controller controller = Get.put(Controller());
  Future verifyotp() async {
    try {
      PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
          verificationId: verificationCode!, smsCode: OTP.toString());

      await FirebaseAuth.instance.signInWithCredential(phoneAuthCredential);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Insert_Product(),
        ),
      );
      //Get.toEnd(() => Bottom_navigation());
    } on FirebaseException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("INVALID OTP"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          OtpTextField(
            numberOfFields: 6,
            borderColor: Color(0xFF512DA8),
            //set to true to show as box or false to show as dash
            showFieldAsBox: true,
            //runs when a code is typed in
            onCodeChanged: (String code) {
              //handle validation or checks here
            },
            //runs when every textfield is filled
            onSubmit: (String verificationCode) {
              setState(() {
                OTP = verificationCode;
              });
            }, // end onSubmit
          ),
          SizedBox(
            height: 40,
          ),
          // GetBuilder<Controller>(
          //   builder: (controller) => controller.isLoding == true
          //       ? Center(child: CircularProgressIndicator())
          //       : Padding(
          //           padding: const EdgeInsets.symmetric(
          //               horizontal: 20, vertical: 20),
          //           child: Comman_Container(
          //             child: Center(
          //                 child: Comman_Text(
          //               text: "Send Otp",
          //               color: Colors.white,
          //               fontweight: FontWeight.bold,
          //               fontsize: 20,
          //             )),
          //             BorderRadius: BorderRadius.circular(40),
          //             height: 45.sp,
          //             width: double.infinity,
          //             color: Color(0xffB7E4C7),
          //             ontap: () {
          //               controller.updateLoader(true);
          //
          //               verifyotp();
          //             },
          //           ),
          //         ),
          // ),
          isLoding == false
              ? Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Comman_Container(
                    child: Center(
                        child: Comman_Text(
                      text: "Send Otp",
                      color: Colors.white,
                      fontweight: FontWeight.bold,
                      fontsize: 20,
                    )),
                    BorderRadius: BorderRadius.circular(40),
                    height: 45,
                    width: double.infinity,
                    color: Color(0xffB7E4C7),
                    ontap: () {
                      setState(() {
                        isLoding = false;
                      });

                      verifyotp();
                    },
                  ))
              : Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }
}
