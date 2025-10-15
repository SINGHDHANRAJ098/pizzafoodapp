import 'package:flutter/material.dart';

class ChefFoodDetail extends StatefulWidget {
  const ChefFoodDetail({super.key});

  @override
  State<ChefFoodDetail> createState() => _ChefFoodDetailState();
}

class _ChefFoodDetailState extends State<ChefFoodDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Container(
          margin:  EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon:  Icon(
              Icons.arrow_back_ios_new,
              size: 18,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        title: Text(
          "Food Details",
          style: TextStyle(
            color: Colors.black,
            fontSize: 17,
            fontWeight: FontWeight.normal,
          ),
        ),
        centerTitle: true,
        actions: [
          Text(
            "EDIT",
            style: TextStyle(
              color: Colors.redAccent,
              fontWeight: FontWeight.normal,
              fontSize: 17,
            ),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding:  EdgeInsets.only(
                  top: 10,
                  left: 10,
                  right: 10,
                  bottom: 10,
                ),
                child: Stack(
                  children: [
                    Image.asset("images/chicken biryani.jpg"),
                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: Chip(label: Text('Breakfast')),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 10,
                      child: Chip(label: Text('Delivery')),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding:  EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Chicken biryani",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "\$60",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding:  EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.location_city_rounded, color: Colors.grey, size: 14),
                    Text(
                      "Kentucky 39495",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.star, size: 12, color: Colors.redAccent),
                      ],
                    ),
                    Text(
                      "4.7",
                      style: TextStyle(
                        color: Colors.redAccent,
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                      ),
                    ),
                    Text(
                      "10 Reviews",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                      ),
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
