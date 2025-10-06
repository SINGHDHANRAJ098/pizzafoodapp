import 'package:flutter/material.dart';

import 'package:food_pizza_hot/model/category.dart';
import 'package:food_pizza_hot/model/category_data.dart';

import 'package:food_pizza_hot/screen/onbording.dart';

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
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Icon(Icons.filter_list, color: Colors.black),
                      ),
                      SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "DELIVER TO",
                            style: TextStyle(
                              color: Colors.redAccent,
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                "Halal Lab office",
                                style: TextStyle(color: Colors.black45),
                              ),
                              Icon(Icons.arrow_drop_down_outlined),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(width: 85),
                  Badge(
                    label: Text('2'), // Display "3" on the badge
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: IconButton(
                        padding: EdgeInsets.all(10),
                        icon: Icon(
                          Icons.shopping_bag_outlined,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                    ),
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
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Column(
                  children: [
                    Image.asset(
                      "images/restaurant.png",
                      height: 200,
                      width: 400,
                      fit: BoxFit.cover,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Rose Garden Restaurant",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "Burger - chicken - Wings - Pizza",
                              style: TextStyle(
                                color: Colors.black45,
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star_border_outlined,
                              color: Colors.redAccent,
                            ),
                            Text(
                              "4.5",
                              style: TextStyle(
                                color: Colors.black45,
                                fontWeight: FontWeight.normal,
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(width: 10,),
                            Icon(
                              Icons.delivery_dining,
                              color: Colors.redAccent,
                            ),
                            Text(
                              "Free",
                              style: TextStyle(
                                color: Colors.black45,
                                fontWeight: FontWeight.normal,
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(width: 10,),
                            Icon(
                              Icons.watch_later_outlined,
                              color: Colors.redAccent,
                            ),
                            Text(
                              "20 min.",
                              style: TextStyle(
                                color: Colors.black45,
                                fontWeight: FontWeight.normal,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
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
