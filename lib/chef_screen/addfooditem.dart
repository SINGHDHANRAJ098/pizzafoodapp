import 'package:flutter/material.dart';

class Addfooditem extends StatefulWidget {
  const Addfooditem({super.key});

  @override
  State<Addfooditem> createState() => _AddNewItemScreenState();
}

class _AddNewItemScreenState extends State<Addfooditem> {
  bool isPickup = true;
  bool isDelivery = false;

  List<String> selectedBasic = ["Onion", "Pappers"];
  List<String> selectedFruit = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Add New Items',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Center(
              child: Text(
                "RESET",
                style: TextStyle(
                  color: Colors.redAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "ITEM NAME",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.5,
              ),
            ),
            SizedBox(height: 6),
            TextField(
              decoration: InputDecoration(
                hintText: "Mazalichiken Halim",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 14,
                ),
              ),
            ),

            SizedBox(height: 20),
            Text(
              "UPLOAD PHOTO/VIDEO",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.5,
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                _buildImageBox("images/burger1.png"),
                SizedBox(width: 10),
                _buildUploadBox(),
                SizedBox(width: 10),
                _buildUploadBox(),
              ],
            ),

            SizedBox(height: 20),
            Text(
              "PRICE",
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
              ),
            ),
            SizedBox(height: 6),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "\$50",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 14,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Row(
                  children: [
                    Checkbox(
                      value: isPickup,
                      activeColor: Colors.redAccent,
                      onChanged: (val) {
                        setState(() => isPickup = val!);
                      },
                    ),
                    Text("Pick up"),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      value: isDelivery,
                      activeColor: Colors.redAccent,
                      onChanged: (val) {
                        setState(() => isDelivery = val!);
                      },
                    ),
                    Text("Delivery"),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              "INGRIDENTS",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.5,
              ),
            ),

            SizedBox(height: 20),
            _buildIngredientsSection(
              title: "Basic",
              items: [
                {"name": "Salt", "icon": Icons.bakery_dining},
                {"name": "Chicken", "icon": Icons.set_meal},
                {"name": "Onion", "icon": Icons.spa},
                {"name": "Garlic", "icon": Icons.energy_savings_leaf},
                {"name": "Pappers", "icon": Icons.local_florist},
                {"name": "Ginger", "icon": Icons.eco},
              ],
              selectedList: selectedBasic,
            ),

            SizedBox(height: 16),
            _buildIngredientsSection(
              title: "Fruit",
              items: [
                {"name": "Avocado", "icon": Icons.emoji_food_beverage},
                {"name": "Apple", "icon": Icons.apple},
                {"name": "Blueberry", "icon": Icons.brightness_5},
                {"name": "Broccoli", "icon": Icons.grass},
                {"name": "Orange", "icon": Icons.add_circle_outlined},
                {"name": "Walnut", "icon": Icons.spa},
              ],
              selectedList: selectedFruit,
            ),

            SizedBox(height: 20),
            Text(
              "DETAILS",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.5,
              ),
            ),
            SizedBox(height: 6),
            TextField(
              maxLines: 4,
              decoration: InputDecoration(
                hintText:
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Bibendum in vel, mattis et amet du mauris turpis.",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding: EdgeInsets.all(12),
              ),
            ),

            SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: Text(
                  "SAVE CHANGES",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageBox(String imagePath) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.asset(imagePath, height: 90, width: 90, fit: BoxFit.cover),
    );
  }

  Widget _buildUploadBox() {
    return Container(
      height: 90,
      width: 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.upload, color: Colors.redAccent),
            SizedBox(height: 4),
            Text("Add", style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }

  Widget _buildIngredientsSection({
    required String title,
    required List<Map<String, dynamic>> items,
    required List<String> selectedList,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
              "See All",
              style: TextStyle(
                color: Colors.redAccent,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        SizedBox(height: 8),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: items.map((item) {
              final isSelected = selectedList.contains(item["name"]);
              return GestureDetector(
                onTap: () {
                  setState(() {
                    if (isSelected) {
                      selectedList.remove(item["name"]);
                    } else {
                      selectedList.add(item["name"]);
                    }
                  });
                },
                child: Container(
                  margin: EdgeInsets.only(right: 12),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: isSelected
                            ? Colors.redAccent
                            : Colors.orange.shade50,
                        child: Icon(
                          item["icon"],
                          color: isSelected ? Colors.white : Colors.redAccent,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        item["name"],
                        style: TextStyle(
                          fontSize: 12,
                          color: isSelected ? Colors.redAccent : Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
