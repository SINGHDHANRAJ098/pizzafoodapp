import 'package:flutter/material.dart';

class RunningOrdersSheet extends StatefulWidget {
  const RunningOrdersSheet({super.key});

  @override
  State<RunningOrdersSheet> createState() => _RunningOrdersSheetState();
}

class _RunningOrdersSheetState extends State<RunningOrdersSheet> {
  final List<Map<String, dynamic>> orders = [
    {
      "name": "New York Pizza",
      "category": "Breakfast",
      "price": 60,
      "id": "32053",
      "image": "images/pizza4.png",
    },
    {
      "name": "Chicken Burger",
      "category": "Breakfast",
      "price": 30,
      "id": "15253",
      "image": "images/burger1.png",
    },
    {
      "name": "Vegetarian Pizza",
      "category": "Breakfast",
      "price": 35,
      "id": "21200",
      "image": "images/pizza3.png",
    },
    {
      "name": "Turkey Bacon Pizza",
      "category": "Breakfast",
      "price": 45,
      "id": "53241",
      "image": "images/pizza1.png",
    },
    {
      "name": "Veggie Burger",
      "category": "Breakfast",
      "price": 25,
      "id": "58464",
      "image": "images/burger2.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 50,
            height: 4,
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "20 Running Orders",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.separated(
              itemCount: orders.length,
              separatorBuilder: (context, index) =>
              const Divider(height: 24, color: Colors.transparent),
              itemBuilder: (context, index) {
                final order = orders[index];
                return _buildOrderCard(order);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderCard(Map<String, dynamic> order) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            order["image"],
            height: 70,
            width: 70,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "#${order["category"]}",
                style: const TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                order["name"],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "ID: ${order["id"]}",
                style: const TextStyle(color: Colors.grey, fontSize: 13),
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  Text(
                    "\$${order["price"]}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        // Example: remove order after "Done"
                        orders.remove(order);
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text("Done"),
                  ),
                  const SizedBox(width: 10),
                  OutlinedButton(
                    onPressed: () {
                      setState(() {
                        // Example: remove order after "Cancel"
                        orders.remove(order);
                      });
                    },
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.orange),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      "Cancel",
                      style: TextStyle(color: Colors.orange),
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
