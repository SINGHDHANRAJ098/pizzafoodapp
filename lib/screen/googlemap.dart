import 'package:flutter/material.dart';
import 'package:food_pizza_hot/screen/onbording.dart';

class Googlemap extends StatefulWidget {
  const Googlemap({super.key});

  @override
  State<Googlemap> createState() => _GooglemapState();
}

class _GooglemapState extends State<Googlemap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Onbording()),
                );
              },
              child: Center(
                child: Text(
                  "Click here",
                  style: TextStyle(color: Colors.redAccent),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
