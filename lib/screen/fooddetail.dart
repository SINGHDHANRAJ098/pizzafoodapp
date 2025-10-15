import 'package:flutter/material.dart';
import 'package:food_pizza_hot/model/Ingredient_class.dart';

class Fooddetail extends StatefulWidget {
  const Fooddetail({super.key});

  @override
  State<Fooddetail> createState() => _FooddetailState();
}

class _FooddetailState extends State<Fooddetail> {
  int count = 2;
  int selectedSize = 14;
  int selectedIngredientIndex = 0;

  final List<Ingredient> ingredients = [
    Ingredient(Icons.science, "Salt"),
    Ingredient(Icons.ramen_dining, "Mushroom"),
    Ingredient(Icons.local_pizza, "Tomato"),
    Ingredient(Icons.food_bank_outlined, "Pepperoni"),
    Ingredient(Icons.soup_kitchen, "Onion"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
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
                    color: Colors.redAccent,
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
                            color: Colors.redAccent,
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
                      color: Colors.redAccent,
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
                      color: Colors.redAccent,
                      size: 22,
                    ),
                    Text(
                      " 4.7",
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                    SizedBox(width: 12),
                    Icon(
                      Icons.delivery_dining_outlined,
                      color: Colors.redAccent,
                      size: 22,
                    ),
                    Text(
                      " Free",
                      style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                    ),
                    SizedBox(width: 12),
                    Icon(Icons.timer_outlined, color: Colors.redAccent, size: 22),
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
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [10, 14, 16].map((size) {
                    final isSelected = selectedSize == size;
                    return GestureDetector(
                      onTap: () => setState(() => selectedSize = size),
                      child: Container(
                        margin:  EdgeInsets.only(right: 10),
                        padding:  EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? Colors.redAccent
                              : Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          '$size"',
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(height: 20),
        
                Text(
                  "INGREDIENTS",
                  style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16),
                ),
                SizedBox(height: 10),
                Row(
                  children: List.generate(
                    ingredients.length,
                    (index) => _buildIngredientIcon(index),
                  ),
                ),
                SizedBox(height: 25),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding:  EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       Text(
                        "\$32",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                if (count > 1) setState(() => count--);
                              },
                              icon:  Icon(Icons.remove,
                                  color: Colors.white, size: 18),
                            ),
                            Text(
                              '$count',
                              style:  TextStyle(
                                  color: Colors.white, fontSize: 16),
                            ),
                            IconButton(
                              onPressed: () => setState(() => count++),
                              icon:  Icon(Icons.add,
                                  color: Colors.white, size: 18),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 25),
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    onPressed: () {},
                    child:  Text(
                      "ADD TO CART",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget _buildIngredientIcon(int index) {
    final ingredient = ingredients[index];
    final isSelected = index == selectedIngredientIndex;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIngredientIndex = index;
        });
      },
      child: Padding(
        padding:  EdgeInsets.only(right: 10),
        child: Column(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: isSelected ? Colors.redAccent : Colors.grey.shade300,
              child: Icon(
                ingredient.icon,
                color: isSelected ? Colors.white : Colors.black,
                size: 18,
              ),
            ),
            SizedBox(height: 5),
            Text(
              ingredient.label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: isSelected ? Colors.redAccent : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

}

