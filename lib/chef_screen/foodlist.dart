import 'package:flutter/material.dart';

class Foodlist extends StatefulWidget {
  const Foodlist({Key? key}) : super(key: key);

  @override
  State<Foodlist> createState() => _MyFoodListScreenState();
}

class _MyFoodListScreenState extends State<Foodlist>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Map<String, dynamic>> foodItems = [
    {
      "name": "Chicken Thai Biriyani",
      "category": "Breakfast",
      "rating": 4.9,
      "reviews": 10,
      "price": 60,
      "image": "images/chicken biryani.jpg",
    },
    {
      "name": "Margherita Pizza",
      "category": "Lunch",
      "rating": 4.7,
      "reviews": 18,
      "price": 30,
      "image": "images/pizza1.png",
    },
    {
      "name": "Panner pizza ",
      "category": "Dinner",
      "rating": 4.8,
      "reviews": 20,
      "price": 25,
      "image": "images/pizza3.png",
    },
    {
      "name": "  italian Pizza ",
      "category": "Breakfast",
      "rating": 4.9,
      "reviews": 12,
      "price": 35,
      "image": "images/pizza4.png",
    },
    {
      "name": "Maha raja Burger",
      "category": "Dinner",
      "rating": 4.6,
      "reviews": 8,
      "price": 55,
      "image": "images/burger2.png",
    },
  ];

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  List<Map<String, dynamic>> getFilteredList(String category) {
    if (category == "All") return foodItems;
    return foodItems.where((item) => item["category"] == category).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: (){
            Navigator.of(context);
          },
            child: const Icon(Icons.arrow_back_ios, color: Colors.black)),
        title: const Text(
          'My Food List',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TabBar(
            controller: _tabController,
            labelColor: Colors.redAccent,
            unselectedLabelColor: Colors.black,
            labelStyle: const TextStyle(fontWeight: FontWeight.bold),
            indicatorColor: Colors.redAccent,
            tabs: const [
              Tab(text: "All"),
              Tab(text: "Breakfast"),
              Tab(text: "Lunch"),
              Tab(text: "Dinner"),
            ],
          ),
          const SizedBox(height: 10),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildFoodList(getFilteredList("All")),
                _buildFoodList(getFilteredList("Breakfast")),
                _buildFoodList(getFilteredList("Lunch")),
                _buildFoodList(getFilteredList("Dinner")),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFoodList(List<Map<String, dynamic>> list) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListView.separated(
        itemCount: list.length,
        separatorBuilder: (context, index) =>
        const Divider(height: 25, color: Colors.grey),
        itemBuilder: (context, index) {
          final food = list[index];
          return _buildFoodCard(food);
        },
      ),
    );
  }

  Widget _buildFoodCard(Map<String, dynamic> food) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            food["image"],
            height: 80,
            width: 80,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      food["name"],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const Icon(Icons.more_horiz, color: Colors.grey),
                ],
              ),
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.red.shade100,

                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  food["category"],
                  style: const TextStyle(
                    color: Colors.redAccent,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.redAccent, size: 16),
                  const SizedBox(width: 4),
                  Text(
                    "${food["rating"]} (${food["reviews"]} Reviews)",
                    style: const TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                  const Spacer(),
                  Text(
                    "\$${food["price"]}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
