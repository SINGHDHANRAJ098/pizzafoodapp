import 'package:flutter/material.dart';

class Paymentsuccessfull extends StatefulWidget {
  const Paymentsuccessfull({super.key});

  @override
  State<Paymentsuccessfull> createState() => _PaymentsuccessfullState();
}

class _PaymentsuccessfullState extends State<Paymentsuccessfull> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image.asset("images/paymentdone.png")),
          Text(
            "Congratulations!",
            style: TextStyle(
              color: Colors.black,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),

          Text(
            "You Successfully make a payment \n enjoy our service!",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,

              fontSize: 14,
            ),
          ),
          SizedBox(height: 30),
          Container(
            height: 50,
            width: 250,
            decoration: BoxDecoration(
              color: Colors.redAccent,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              "TRACK ORDER",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
