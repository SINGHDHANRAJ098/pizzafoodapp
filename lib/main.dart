import 'package:flutter/material.dart';
import 'package:food_pizza_hot/screen/Forgot_password.dart';
import 'package:food_pizza_hot/screen/accessloction.dart';
import 'package:food_pizza_hot/screen/home.dart';

import 'package:food_pizza_hot/screen/login.dart';
import 'package:food_pizza_hot/screen/onbording.dart';
import 'package:food_pizza_hot/screen/onbording1.dart';
import 'package:food_pizza_hot/screen/onbording2.dart';
import 'package:food_pizza_hot/screen/signup.dart';
import 'package:food_pizza_hot/sign_up.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Home(),
    );
  }
}

