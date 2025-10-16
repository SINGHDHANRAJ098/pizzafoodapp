import 'package:flutter/material.dart';
import 'package:food_pizza_hot/chef_screen/Chef_Bottomnav.dart';
import 'package:food_pizza_hot/chef_screen/Chef_notification.dart';
import 'package:food_pizza_hot/chef_screen/Chefprofile.dart';
import 'package:food_pizza_hot/chef_screen/chef_food_detail.dart';
import 'package:food_pizza_hot/chef_screen/chef_review.dart';
import 'package:food_pizza_hot/chef_screen/foodlist.dart';
import 'package:food_pizza_hot/chef_screen/withdraw.dart';
import 'package:food_pizza_hot/screen/Addressinfo.dart';
import 'package:food_pizza_hot/screen/Forgot_password.dart';
import 'package:food_pizza_hot/screen/Order.dart';
import 'package:food_pizza_hot/screen/Paymentsuccessfull.dart';
import 'package:food_pizza_hot/screen/accessloction.dart';
import 'package:food_pizza_hot/screen/addcard.dart';
import 'package:food_pizza_hot/screen/bottomnav.dart';
import 'package:food_pizza_hot/screen/editprofile.dart';
import 'package:food_pizza_hot/screen/fooddetail.dart';
import 'package:food_pizza_hot/screen/home.dart';

import 'package:food_pizza_hot/screen/login.dart';
import 'package:food_pizza_hot/screen/onbording.dart';
import 'package:food_pizza_hot/screen/onbording1.dart';
import 'package:food_pizza_hot/screen/onbording2.dart';
import 'package:food_pizza_hot/screen/payment..dart';
import 'package:food_pizza_hot/screen/personalinfo.dart';
import 'package:food_pizza_hot/screen/profile.dart';
import 'package:food_pizza_hot/screen/restaurent.dart';
import 'package:food_pizza_hot/screen/signup.dart';
import 'package:food_pizza_hot/screen/try.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: HomeScreen()
        ,
    );
  }
}

