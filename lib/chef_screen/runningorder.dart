import 'package:flutter/material.dart';

class Runningorder extends StatefulWidget {
  const Runningorder({super.key});

  @override
  State<Runningorder> createState() => _RunningorderState();
}

class _RunningorderState extends State<Runningorder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(title: GestureDetector(
        onTap: (){
          Navigator.of(context);
        },
      )
      )
    );
  }
}
