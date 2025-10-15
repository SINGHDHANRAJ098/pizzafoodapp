import 'package:flutter/material.dart';
import 'package:food_pizza_hot/screen/payment..dart';

class Addcard extends StatefulWidget {
  const Addcard({super.key});

  @override
  State<Addcard> createState() => _AddcardState();
}

class _AddcardState extends State<Addcard> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController expiryDateController = TextEditingController();
  final TextEditingController cvcController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Payment()),
                      );
                    },
                    icon: Icon(Icons.arrow_back_ios),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Add Card",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 30),

              Text("CARD HOLDER NAME", style: labelStyle),
              SizedBox(height: 6),
              TextField(
                controller: nameController,
                decoration: inputDecoration("Vishal Khadok"),
              ),
              SizedBox(height: 20),

              Text("CARD NUMBER", style: labelStyle),
              SizedBox(height: 6),
              TextField(
                controller: cardNumberController,
                keyboardType: TextInputType.number,
                decoration: inputDecoration("2134  ••••  ••••"),
              ),
              SizedBox(height: 20),

              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("EXPIRE DATE", style: labelStyle),
                        SizedBox(height: 6),
                        TextField(
                          controller: expiryDateController,
                          keyboardType: TextInputType.datetime,
                          decoration: inputDecoration("mm/yyyy"),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("CVC", style: labelStyle),
                        SizedBox(height: 6),
                        TextField(
                          controller: cvcController,
                          keyboardType: TextInputType.number,
                          obscureText: true,
                          decoration: inputDecoration("***"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Spacer(),

              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Colors.redAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    "ADD & MAKE PAYMENT",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: Color(0xFFF3F6FB),
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
    );
  }

  TextStyle get labelStyle => TextStyle(
    fontSize: 12,
    color: Colors.grey.shade600,
    fontWeight: FontWeight.w500,
  );
}
