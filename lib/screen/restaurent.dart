import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_pizza_hot/model/burger_data.dart';
import 'package:food_pizza_hot/model/category.dart';
import 'package:food_pizza_hot/model/category_data.dart';
import 'package:food_pizza_hot/model/pizza_data.dart';
import 'package:food_pizza_hot/screen/bottomnav.dart';
import 'package:food_pizza_hot/screen/fooddetail.dart';
import 'package:food_pizza_hot/screen/home.dart';

import '../model/burger.dart';
import '../model/pizza.dart';

class Restaurent extends StatefulWidget {
  const Restaurent({super.key});

  @override
  State<Restaurent> createState() => _RestaurentState();
}

class _RestaurentState extends State<Restaurent> {
  List<CategoryModel> categorise1 = [];
  List<PizzaModel> pizza = [];
  List<BurgerModel> burger = [];
  String track = "0";
  @override
  void initState() {
    categorise1 = getCategories();
    pizza = getPizza();
    burger = getBurger();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundColor: Colors.grey.shade200,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Bottomnav()),
                      );
                    },
                    icon: Center(
                      child: Icon(Icons.arrow_back_ios, color: Colors.black),
                    ),
                  ),
                ),
                Text(
                  "RestaurantView",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                CircleAvatar(
                  radius: 16,
                  backgroundColor: Colors.grey.shade200,
                  child: Center(
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      icon: Icon(
                        Icons.more_horiz_outlined,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                "images/restaurant.png",
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 15),
            Text(
              "Spicy Restaurant",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              "Maecenas sed diam eget risus varius blandit sit amet non magna.Integer posuere erat a ante venenatis dapibus posuere velit aliquet.",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(
                  Icons.star_border_outlined,
                  color: Colors.redAccent,
                  size: 22,
                ),
                SizedBox(width: 4),
                Text(
                  "4.7",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 15),
                Icon(
                  Icons.delivery_dining_outlined,
                  color: Colors.redAccent,
                  size: 22,
                ),
                SizedBox(width: 4),
                Text(
                  "Free",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 15),
                Icon(Icons.timer_outlined, color: Colors.redAccent, size: 22),
                SizedBox(width: 4),
                Text(
                  "20 min",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Container(
              height: 40,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: categorise1.length,
                itemBuilder: (context, index) {
                  return Categoryitem(
                    categorise1[index].name!,
                    index.toString(),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Pizza",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            SizedBox(height: 20),
            SizedBox(height: 20),

            track == "0"
                ? Container(
                    margin: EdgeInsets.only(right: 10, left: 10),
                    child: GridView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.6,
                        mainAxisSpacing: 10.0,
                        crossAxisSpacing: 10.0,
                      ),
                      itemCount: pizza.length,
                      itemBuilder: (context, index) {
                        return CategoryFood(
                          pizza[index].name!,
                          pizza[index].image!,
                          pizza[index].price!,
                        );
                      },
                    ),
                  )
                : track == "1"
                ? Container(
                    margin: EdgeInsets.only(right: 10,left: 10),
                    child: GridView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics:
                          NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.6,
                        mainAxisSpacing: 10.0,
                        crossAxisSpacing: 10.0,
                      ),
                      itemCount: burger.length,
                      itemBuilder: (context, index) {
                        return CategoryFood(
                          burger[index].name!,
                          burger[index].image!,
                          burger[index].price!,
                        );
                      },
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  Widget CategoryFood(String name, String image, String price) {
    return Container(
      height: 50,
      margin: EdgeInsets.only(right: 20),
      padding: EdgeInsets.only(left: 10, top: 10),
      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(image, height: 130, width: 130, fit: BoxFit.contain),
          Text(
            name,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            "Spicy Restaurant",
            style: TextStyle(
              color: Colors.black26,
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 2),
          Text(
            price,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          Spacer(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start
            ,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Fooddetail()));
                },
                child: Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    color: Color(0xffef2b39),
                    borderRadius: BorderRadius.circular(18),
                  ),

                  child: Icon(Icons.add, color: Colors.white, size: 20.0),

                ),

              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget Categoryitem(String name, String categoryindex) {
    return GestureDetector(
      onTap: () {
        track = categoryindex.toString();
        setState(() {});
      },
      child: track == categoryindex
          ? Container(
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              margin: EdgeInsets.only(right: 20),

              decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )
          : Container(
              margin: EdgeInsets.only(right: 10.0 ,left: 10),
              padding: EdgeInsets.only( right: 20),
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
