import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_pizza_hot/screen/onbording1.dart';

class Onbording extends StatefulWidget {
  const Onbording({super.key});

  @override
  State<Onbording> createState() => _OnbordingState();
}

class _OnbordingState extends State<Onbording> {

  @override
  void initState() {

    super.initState();
    Timer(Duration(seconds: 2), () {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Onbording1()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Center(child: Image.asset("images/pizzalogo.png"))],
          ),
        ),
      ),
    );
  }
}
