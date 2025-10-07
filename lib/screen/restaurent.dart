import 'package:flutter/material.dart';

class Restaurent extends StatefulWidget {
  const Restaurent({super.key});

  @override
  State<Restaurent> createState() => _RestaurentState();
}

class _RestaurentState extends State<Restaurent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Image.asset("i")
        ],
      ),

    );
  }
}
