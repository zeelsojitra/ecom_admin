import 'package:ecom_admin/insert_product.dart';
import 'package:ecom_admin/view/sign_in.dart';
import 'package:ecom_admin/view/sign_up.dart';
import 'package:flutter/material.dart';
import '../common_screen/Comman_Container.dart';
import '../common_screen/Comman_text.dart';

class Tab_Bar extends StatefulWidget {
  const Tab_Bar({Key? key}) : super(key: key);

  @override
  State<Tab_Bar> createState() => _Tab_BarState();
}

class _Tab_BarState extends State<Tab_Bar> with SingleTickerProviderStateMixin {
  TabController? tabController;
  final gloablekey = GlobalKey<FormState>();
  final Email_controler = TextEditingController();
  final Password_controler = TextEditingController();
  List name = [
    'Sign Up',
    'Sign In',
  ];
  List tabItem = [
    "Sign Up",
    "Sign In",
  ];
  int selected = 0;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);

    tabController!.addListener(() {
      setState(() {
        selected = tabController!.index;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Comman_Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 15, left: 15, top: 15, bottom: 5),
                          child: CircleAvatar(
                            radius: 17,
                            backgroundColor: Colors.green,
                            child: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(Icons.arrow_back_outlined,
                                  size: 25, color: Colors.white),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Comman_Text(
                                text: "Shipping and Track Anytime ",
                                color: Colors.white,
                                fontsize: 17,
                                fontweight: FontWeight.bold,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Comman_Text(
                                text: "Get great experience with tracky",
                                color: Colors.white70,
                                fontsize: 14,
                                fontweight: FontWeight.w400,
                              ),
                              SizedBox(
                                height: 30,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    height: 220,
                    width: double.infinity,
                    gradient: LinearGradient(colors: [
                      Color(0xff2D6A4F),
                      Color(0xff95D5B2),
                    ]),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 120, right: 400, left: 600),
                    child: Container(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 2,
                          ),
                          Container(
                            child: TabBar(
                              labelPadding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              controller: tabController,
                              indicatorColor: Color(0xff2D6A4F),
                              indicatorPadding:
                                  EdgeInsets.symmetric(horizontal: 25),
                              tabs: List.generate(
                                2,
                                (index) => Center(
                                  child: Comman_Text(
                                    text: name[index],
                                    fontsize: 16,
                                    color: selected == index
                                        ? Color(0xff2D6A4F)
                                        : Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: Colors.white,
                            ),
                            height: 300,
                            width: 500,
                            child: TabBarView(
                              controller: tabController,
                              children: [
                                Sign_Up(),
                                Sign_In(),
                              ],
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 1,
                            offset: Offset(2, 2),
                            blurRadius: 7,
                          )
                        ],
                      ),
                      height: 350,
                      width: 320,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Center(
                child: MaterialButton(
                  child: Text("Goto Home"),
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Insert_Product(),
                      )),
                ),
              ),
              // Center(
              //   child: Comman_Text(
              //     text: "Or Sign In With",
              //     color: Colors.grey,
              //     fontweight: FontWeight.w400,
              //     fontsize: 16,
              //   ),
              // ),
              // SizedBox(
              //   height: 50,
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     GestureDetector(
              //       onTap: () {
              //         Navigator.push(
              //             context,
              //             MaterialPageRoute(
              //               builder: (context) => Enter_mobile(),
              //             ));
              //       },
              //       child: Container(
              //         height: 38,
              //         width: 38,
              //         decoration: BoxDecoration(
              //           shape: BoxShape.circle,
              //           color: Colors.white,
              //           boxShadow: [
              //             BoxShadow(
              //               color: Colors.grey,
              //               blurRadius: 1,
              //               offset: Offset(2, 3),
              //               spreadRadius: 1,
              //             )
              //           ],
              //         ),
              //         child: Lottie.asset(
              //           "asserts/lottie/calling.json",
              //           width: 27,
              //           height: 27,
              //         ),
              //       ),
              //     ),
              //     MaterialButton(
              //       child: Text("Goto Home"),
              //       onPressed: () => Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //             builder: (context) => Insert_Product(),
              //           )),
              //     ),
              //     // GestureDetector(
              //     //   onTap: () {
              //     //     print("google");
              //     //     GoogleAuthService.signInWithGoogle().then((value) {
              //     //       if (value != null) {
              //     //         Navigator.pushReplacement(
              //     //             context,
              //     //             MaterialPageRoute(
              //     //               builder: (context) => Insert_Product(),
              //     //             ));
              //     //       } else {
              //     //         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              //     //             content: Text(
              //     //                 "Email is already in use by another accoount")));
              //     //       }
              //     //     });
              //     //   },
              //     //   child: Container(
              //     //     decoration: BoxDecoration(
              //     //       shape: BoxShape.circle,
              //     //       color: Colors.white,
              //     //       boxShadow: [
              //     //         BoxShadow(
              //     //           color: Colors.grey,
              //     //           blurRadius: 1,
              //     //           offset: Offset(2, 3),
              //     //           spreadRadius: 1,
              //     //         )
              //     //       ],
              //     //     ),
              //     //     height: 38,
              //     //     width: 38,
              //     //     child: Center(
              //     //       child: Lottie.asset(
              //     //         'asserts/lottie/google.json',
              //     //         height: 27,
              //     //         width: 27,
              //     //       ),
              //     //     ),
              //     //   ),
              //     // ),
              //     // GestureDetector(
              //     //   onTap: () {
              //     //     ScaffoldMessenger.of(context).showSnackBar(
              //     //         SnackBar(content: Text("Invalid User!")));
              //     //   },
              //     //   child: Container(
              //     //     decoration: BoxDecoration(
              //     //       shape: BoxShape.circle,
              //     //       color: Colors.white,
              //     //       boxShadow: [
              //     //         BoxShadow(
              //     //           color: Colors.grey,
              //     //           blurRadius: 1,
              //     //           offset: Offset(2, 3),
              //     //           spreadRadius: 1,
              //     //         )
              //     //       ],
              //     //     ),
              //     //     height: 38,
              //     //     width: 38,
              //     //     child: Center(
              //     //       child: Lottie.asset(
              //     //         'asserts/lottie/apple.json',
              //     //         height: 27,
              //     //         width: 27,
              //     //       ),
              //     //     ),
              //     //   ),
              //     // ),
              //   ],
              // ),
              // SizedBox(
              //   height: 30,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
