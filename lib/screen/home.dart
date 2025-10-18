import 'package:flutter/material.dart';

import 'package:food_pizza_hot/model/category.dart';
import 'package:food_pizza_hot/model/category_data.dart';
import 'package:food_pizza_hot/screen/cart.dart';

import 'package:food_pizza_hot/screen/onbording.dart';
import 'package:food_pizza_hot/screen/restaurent.dart';
import 'package:iconsax/iconsax.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categoris = [];

  @override
  void initState() {
    categoris = getCategories();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 18,
                        backgroundColor: Color(0xFFF6F6F6),
                        child: Icon(Icons.menu, color: Colors.black),
                      ),
                      SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "DELIVER TO",
                            style: TextStyle(
                              color: Colors.redAccent,
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                "Halal Lab office",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Icon(Icons.keyboard_arrow_down_rounded, size: 20),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Cart()));
                        },
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.black,
                          child: Icon(Iconsax.shopping_bag, color: Colors.white),
                        ),
                      ),
                      Positioned(
                        right: 2,
                        top: 2,
                        child: Container(
                          height: 16,
                          width: 16,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.redAccent,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            "2",
                            style: TextStyle(fontSize: 10, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    "Hey Halal, ",
                    style: TextStyle(
                      color: Colors.black38,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    "Good Afternoon!",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search",
                    border: InputBorder.none,
                    icon: Icon(Icons.search),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "All Categories",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 15,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "See All",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 15,
                        ),
                      ),
                      Icon(Icons.keyboard_arrow_right_sharp),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                height: 100,

                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: categoris.length,
                  itemBuilder: (context, index) {
                    return CategoryTail(
                      image: categoris[index].image!,
                      name: categoris[index].name!,
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Open Restaurants",
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 15,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "See All",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                          ),
                        ),
                        Icon(Icons.keyboard_arrow_right_sharp),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),


              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder:(context)=>Restaurent()));
                },
                child: Container(
                  padding: EdgeInsets.all(5),
                  margin: const EdgeInsets.only(bottom: 24),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.grey.shade200
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          "images/restaurant.png",
                          height: 180,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Rose Garden restaurant ",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      SizedBox(height: 4),
                      Text("Burger - pizza - Pasta", style: TextStyle(color: Colors.grey)),

                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.redAccent, size: 16),
                          SizedBox(width: 4),
                          Text("4 . 7", style: TextStyle(fontWeight: FontWeight.w500)),

                          SizedBox(width: 12),
                          Icon(
                            Icons.local_shipping_outlined,
                            size: 16,
                            color: Colors.redAccent,
                          ),
                          SizedBox(width: 4),
                          Text(
                           "Free",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),

                          SizedBox(width: 12),
                          Icon(Icons.timer, size: 16, color: Colors.redAccent),
                          SizedBox(width: 4),
                          Text("20 mins", style: TextStyle(fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),SizedBox(height: 12,),

              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder:(context)=>Restaurent()));
                },
                child: Container(
                  padding: EdgeInsets.all(5),
                  margin: const EdgeInsets.only(bottom: 24),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.grey.shade200
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          "images/resta.jpg",
                          height: 180,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Namo Cafe & Restaurant ",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      SizedBox(height: 4),
                      Text("Burger - pizza - Pasta", style: TextStyle(color: Colors.grey)),

                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.redAccent, size: 16),
                          SizedBox(width: 4),
                          Text("4 . 3", style: TextStyle(fontWeight: FontWeight.w500)),

                          SizedBox(width: 12),
                          Icon(
                            Icons.local_shipping_outlined,
                            size: 16,
                            color: Colors.redAccent,
                          ),
                          SizedBox(width: 4),
                          Text(
                            "\$5",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),

                          SizedBox(width: 12),
                          Icon(Icons.timer, size: 16, color: Colors.redAccent),
                          SizedBox(width: 4),
                          Text("15 mins", style: TextStyle(fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryTail extends StatefulWidget {
  String name, image;
  CategoryTail({required this.image, required this.name});

  @override
  State<CategoryTail> createState() => _CategoryTailState();
}

class _CategoryTailState extends State<CategoryTail> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10.0, right: 10.0),
      margin: EdgeInsets.only(right: 20),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.grey.shade200, blurRadius: 6)],
      ),
      child: Column(
        children: [
          Image.asset(widget.image, height: 60, width: 60, fit: BoxFit.cover),
          SizedBox(height: 5),
          Text(
            widget.name,
            style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
