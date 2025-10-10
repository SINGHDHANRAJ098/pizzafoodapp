import 'package:flutter/material.dart';

class Fooddetail extends StatefulWidget {
  const Fooddetail({super.key});

  @override
  State<Fooddetail> createState() => _FooddetailState();
}

class _FooddetailState extends State<Fooddetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_back_ios, color: Colors.black),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Details",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFFD88639),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Center(
                        child: Image.asset('images/pizza1.png', height: 180),
                      ),
                    ),
                    Positioned(
                      bottom: 15,
                      right: 15,
                      child: CircleAvatar(
                        backgroundColor: Colors.white.withOpacity(0.6),
                        radius: 18,
                        child: Icon(
                          Icons.favorite_border,
                          color: Colors.orange,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.local_pizza_outlined,
                    color: Colors.orange,
                    size: 16,
                  ),
                  SizedBox(width: 8),
                  Text(
                    "Uttora Coffee House",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Text(
                "Pizza Calzone European",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(height: 5),
              Text(
                "Prosciutto e funghi is a pizza variety that is topped with tomato sauce.",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Icon(
                    Icons.star_border_outlined,
                    color: Colors.orange,
                    size: 22,
                  ),
                  Text(
                    " 4.7",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                  SizedBox(width: 12),
                  Icon(
                    Icons.delivery_dining_outlined,
                    color: Colors.orange,
                    size: 22,
                  ),
                  Text(
                    " Free",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                  ),
                  SizedBox(width: 12),
                  Icon(Icons.timer_outlined, color: Colors.orange, size: 22),
                  Text(
                    " 20 Min",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    " SIZE: ",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
