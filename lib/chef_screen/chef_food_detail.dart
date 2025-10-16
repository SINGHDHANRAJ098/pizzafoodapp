import 'package:flutter/material.dart';


class ChefFoodDetail extends StatefulWidget {
  const ChefFoodDetail({super.key});

  @override
  State<ChefFoodDetail> createState() => _FoodDetailsScreenState();
}

class _FoodDetailsScreenState extends State<ChefFoodDetail> {
  Set<String> selectedIngredients = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildCircleButton(
                      icon: Icons.arrow_back_ios_new,
                      onTap: () => Navigator.pop(context),
                    ),
                    const Text(
                      "Food Details",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      "EDIT",
                      style: TextStyle(
                        color: Colors.redAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),


              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 16),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        "images/chicken biryani.jpg", // your image path
                        height: 220,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 12,
                      left: 16,
                      right: 16,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildTag("Breakfast"),
                          _buildTag("Delivery"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

               SizedBox(height: 16),


              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Chicken Thai Biriyani",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(Icons.location_on, color: Colors.grey, size: 16),
                            SizedBox(width: 4),
                            Text(
                              "Kentucky 39495",
                              style: TextStyle(color: Colors.grey, fontSize: 13),
                            ),
                          ],
                        ),
                      ],
                    ),
                     Text(
                      "\$60",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),

               SizedBox(height: 8),


              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                     Icon(Icons.star, color: Colors.redAccent, size: 20),
                     SizedBox(width: 4),
                     Text(
                      "4.9",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                     SizedBox(width: 4),
                    Text(
                      "(10 Reviews)",
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                  ],
                ),
              ),

               SizedBox(height: 16),


              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(
                      "INGREDIENTS",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                     SizedBox(height: 12),
                    Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      alignment: WrapAlignment.start,
                      children: [
                        _buildIngredient("Salt", Icons.water_drop),
                        _buildIngredient("Chicken", Icons.set_meal),
                        _buildIngredient("Onion", Icons.spa),
                        _buildIngredient("Garlic", Icons.energy_savings_leaf),
                        _buildIngredient("Pappers", Icons.local_florist),
                        _buildIngredient("Ginger", Icons.eco),
                        _buildIngredient("Broccoli", Icons.grass),
                        _buildIngredient("Orange", Icons.sunny),
                        _buildIngredient("Walnut", Icons.restaurant),
                      ],
                    ),

                  ],
                ),
              ),

               SizedBox(height: 24),


              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(
                      "Description",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                     SizedBox(height: 8),
                    Text(
                      "Lorem ipsum dolor sit amet, consectetur Maton adipiscing elit. "
                          "Bibendum in vel, mattis et amet dui mauris turpis.",
                      style: TextStyle(color: Colors.grey.shade700, height: 1.5),
                    ),
                  ],
                ),
              ),

               SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildCircleButton({required IconData icon, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: 18,
        backgroundColor: Colors.grey.shade200,
        child: Icon(icon, color: Colors.black, size: 18),
      ),
    );
  }

  Widget _buildTag(String text) {
    return Container(
      padding:  EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.85),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _buildIngredient(String name, IconData icon) {
    final bool isSelected = selectedIngredients.contains(name);

    return GestureDetector(
      onTap: () {
        setState(() {
          if (isSelected) {
            selectedIngredients.remove(name);
          } else {
            selectedIngredients.add(name);
          }
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: isSelected ? Colors.redAccent : Colors.orange.shade50,
            child: Icon(
              icon,
              color: isSelected ? Colors.white : Colors.redAccent,
              size: 20,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            name,
            style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

}
