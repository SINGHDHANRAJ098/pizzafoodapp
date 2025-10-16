import 'package:flutter/material.dart';

class Addfooditem extends StatefulWidget {
  const Addfooditem({super.key});

  @override
  State<Addfooditem> createState() => _AddfooditemState();
}

class _AddfooditemState extends State<Addfooditem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Icon(Icons.arrow_back_ios, color: Colors.black, size: 14),
        title: Text(
          "Add New Items",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        actions: [
          Text(
            "RESET   ",
            style: TextStyle(
              color: Colors.redAccent,
              fontWeight: FontWeight.normal,
              fontSize: 16,
            ),
          ),
        ],
      ),
      body: Padding(
        padding:  EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text(
              "ITEM NAME",
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                hintText: "biryani by kilo",suffixIconColor: Colors.grey.shade300,
                fillColor: Colors.grey.shade200,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),


                ),
              ),
            ),
            SizedBox(height: 10,),
            Text("UPLOAD PHOTO/VIDEO",style: TextStyle(color: Colors.black),)
          ],
        ),
      ),
    );
  }
}
