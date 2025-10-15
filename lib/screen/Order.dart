import 'package:flutter/material.dart';
import 'package:food_pizza_hot/screen/bottomnav.dart';

class Order extends StatefulWidget {
  const Order({super.key});

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final ongoingOrders = [
    {
      'type': 'Food',
      'name': 'Pizza Hut',
      'price': '\$35.25',
      'date': '29 JAN, 12:30',
      'items': '03 Items',
      'image': 'images/pizza1.png',
      'id': '#162432',
    },
    {
      'type': 'Drink',
      'name': 'McDonald',
      'price': '\$40.15',
      'date': '30 JAN, 12:30',
      'items': '02 Items',
      'image': 'images/pizza3.png',
      'id': '#242432',
    },
    {
      'type': 'Drink',
      'name': 'Starbucks',
      'price': '\$10.20',
      'date': '30 JAN, 12:30',
      'items': '01 Items',
      'image': 'images/pizza4.png',
      'id': '#240112',
    },
  ];

  final historyOrders = [
    {
      'type': 'Food',
      'name': 'Pizza Hut',
      'price': '\$35.25',
      'date': '29 JAN, 12:30',
      'items': '03 Items',
      'image': 'images/pizza1.png',
      'id': '#162432',
      'status': 'Completed',
    },
    {
      'type': 'Drink',
      'name': 'McDonald',
      'price': '\$40.15',
      'date': '30 JAN, 12:30',
      'items': '02 Items',
      'image': 'images/pizza4.png',
      'id': '#242432',
      'status': 'Completed',
    },
    {
      'type': 'Drink',
      'name': 'Starbucks',
      'price': '\$10.20',
      'date': '30 JAN, 12:30',
      'items': '01 Items',
      'image': 'images/pizza1.png',
      'id': '#240112',
      'status': 'Canceled',
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new,
              size: 18,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Bottomnav()),
              );
            },
          ),
        ),
        title: const Text(
          "My Orders",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        actions: [
          Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(Icons.more_horiz, color: Colors.black),
              onPressed: () {},
            ),
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.redAccent,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.redAccent,
          indicatorWeight: 2.5,
          tabs: const [
            Tab(text: "Ongoing"),
            Tab(text: "History"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [_buildOngoingOrders(), _buildHistoryOrders()],
      ),
    );
  }

  Widget _buildOngoingOrders() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: ongoingOrders.length,
      itemBuilder: (context, index) {
        final order = ongoingOrders[index];
        return _buildOngoingOrderCard(order);
      },
    );
  }

  Widget _buildHistoryOrders() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: historyOrders.length,
      itemBuilder: (context, index) {
        final order = historyOrders[index];
        return _buildHistoryOrderCard(order);
      },
    );
  }

  Widget _buildOngoingOrderCard(Map<String, String> order) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(order['type']!, style: const TextStyle(color: Colors.black54)),
        const SizedBox(height: 8),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                order['image']!,
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
                  Row(
                    children: [
                      Text(
                        order['name']!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        order['id']!,
                        style: const TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Text(
                        order['price']!,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        order['items']!,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Track Order",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: SizedBox(
                height: 40,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.redAccent),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Cancel",
                    style: TextStyle(color: Colors.redAccent),
                  ),
                ),
              ),
            ),
          ],
        ),
        const Divider(height: 30, thickness: 1, color: Color(0xFFEAEAEA)),
      ],
    );
  }

  Widget _buildHistoryOrderCard(Map<String, String> order) {
    final statusColor = order['status'] == 'Completed'
        ? Colors.green
        : Colors.red;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(order['type']!, style: const TextStyle(color: Colors.black54)),
            const SizedBox(width: 8),
            Text(
              order['status']!,
              style: TextStyle(color: statusColor, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                order['image']!,
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
                  Row(
                    children: [
                      Text(
                        order['name']!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        order['id']!,
                        style: const TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Text(
                        order['price']!,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        order['date']!,
                        style: const TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        "• ${order['items']!}",
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 40,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.redAccent),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Rate",
                    style: TextStyle(color: Colors.redAccent),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: SizedBox(
                height: 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Re-Order",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
        const Divider(height: 30, thickness: 1, color: Color(0xFFEAEAEA)),
      ],
    );
  }
}
