import 'package:ecom_admin/view/inner_product.dart';
import 'package:ecom_admin/view/sign_up.dart';
import 'package:ecom_admin/view/tab_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'insert_product.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyB2-4U5qA6nIXM8UtzUjy81u0752oInKvU",
          appId: "1:918233472617:web:66215b038cc8a9416b4cf8",
          messagingSenderId: "918233472617",
          storageBucket: "e-commerce-91815.appspot.com",
          projectId: "e-commerce-91815"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: Tab_Bar(),
    );
  }
}
