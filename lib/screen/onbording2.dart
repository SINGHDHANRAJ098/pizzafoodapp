import 'package:flutter/material.dart';
import 'package:food_pizza_hot/screen/onbording1.dart';
import 'package:food_pizza_hot/screen/onbording3.dart';

class Onbording2 extends StatefulWidget {
  const Onbording2({super.key});

  @override
  State<Onbording2> createState() => _Onbording2State();
}

class _Onbording2State extends State<Onbording2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Image.asset("images/onbording2.png"),
              ),
              SizedBox(height: 20),
              Text(
                "Order form choosen chef",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                "Get all ypur loved in one once place, \n you just place the orer we do rest",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
