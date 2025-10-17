import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 12),

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
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Color(0xFFF6F6F6),
                        child: Icon(Iconsax.shopping_bag, color: Colors.black),
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

              Text.rich(
                TextSpan(
                  text: "Hey Halal, ",
                  style: TextStyle(fontSize: 18),
                  children: [
                    TextSpan(
                      text: "Good Afternoon!",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 16),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: Color(0xFFF6F6F6),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search dishes, restaurants",
                    border: InputBorder.none,
                    icon: Icon(Iconsax.search_normal),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "All Categories",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text("See All", style: TextStyle(color: Colors.redAccent)),
                ],
              ),
              SizedBox(height: 16),

              SizedBox(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildCategoryCard("Pizza", "Images/burger1.png", "\$70"),
                    _buildCategoryCard("Burger", "Images/burger2.png", "\$50"),
                    _buildCategoryCard("Pasta", "Images/pizza1.png", "\$60"),
                    _buildCategoryCard("Fries", "Images/pizza3.png", "\$30"),
                  ],
                ),
              ),

              SizedBox(height: 24),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Open Restaurants",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text("See All", style: TextStyle(color: Colors.redAccent)),
                ],
              ),
              SizedBox(height: 12),

              _buildRestaurantCard(
                name: "Rose Garden Restaurant",
                image: "images/restaurant.png",
                tags: ["Burger", "Chicken", "Riche", "Wings"],
                rating: 4.7,
                deliveryTime: "20 min",
                isFreeDelivery: true,
              ),
              SizedBox(height: 20),
              _buildRestaurantCard(
                name: "Spicy Spoon Diner",
                image:
                    "images/restaurant.png", // <-- Add this image to your assets
                tags: ["Pasta", "Salad", "Dessert"],
                rating: 4.5,
                deliveryTime: "25 min",
                isFreeDelivery: false,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryCard(String title, String imagePath, String price) {
    return Container(
      width: 120,
      margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.05),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagePath, height: 60),
          SizedBox(height: 8),
          Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 4),
          Text(
            " $price",
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildRestaurantCard({
    required String name,
    required String image,
    required List<String> tags,
    required double rating,
    required String deliveryTime,
    required bool isFreeDelivery,
  }) {
    return Container(
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
              image,
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 8),
          Text(
            name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(height: 4),
          Text(tags.join(" • "), style: TextStyle(color: Colors.grey)),

          SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.star, color: Colors.redAccent, size: 16),
              SizedBox(width: 4),
              Text("$rating", style: TextStyle(fontWeight: FontWeight.w500)),

              SizedBox(width: 12),
              Icon(
                Icons.local_shipping_outlined,
                size: 16,
                color: Colors.redAccent,
              ),
              SizedBox(width: 4),
              Text(
                isFreeDelivery ? "Free" : "\$5",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),

              SizedBox(width: 12),
              Icon(Icons.timer, size: 16, color: Colors.redAccent),
              SizedBox(width: 4),
              Text(deliveryTime, style: TextStyle(fontWeight: FontWeight.w500)),
            ],
          ),
        ],
      ),
    );
  }
}
