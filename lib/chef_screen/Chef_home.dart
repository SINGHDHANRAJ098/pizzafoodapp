import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:food_pizza_hot/chef_screen/chef_food_detail.dart';
import 'package:food_pizza_hot/chef_screen/runningorder.dart';

class ChefHome extends StatefulWidget {
  const ChefHome({super.key});

  @override
  State<ChefHome> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<ChefHome> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.menu, color: Colors.black),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "LOCATION",
              style: TextStyle(
                color: Colors.redAccent,
                fontSize: 12,
                letterSpacing: 1,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                Text(
                  "Halal Lab office",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Icon(Icons.keyboard_arrow_down, color: Colors.black),
              ],
            ),
          ],
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: CircleAvatar(

              backgroundImage: AssetImage('images/boy.jpg'),
            ),
          ),
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildStatCard("20", "RUNNING ORDERS"),
              _buildStatCard("05", "ORDER REQUEST"),
            ],
          ),
          const SizedBox(height: 20),


          _buildRevenueChart(),
          const SizedBox(height: 20),


          _buildReviewCard(),
          const SizedBox(height: 20),


          _buildPopularSection(),
        ],
      ),
    );
  }

  Widget _buildStatCard(String number, String title) {
    return Expanded(
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Runningorder()));
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 6),
          padding: const EdgeInsets.symmetric(vertical: 24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Text(
                number,
                style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRevenueChart() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Total Revenue",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Row(
                children: const [
                  Text("Daily", style: TextStyle(color: Colors.grey)),
                  SizedBox(width: 5),
                  Icon(Icons.arrow_drop_down, color: Colors.grey),
                ],
              ),
            ],
    ),
          const SizedBox(height: 5),
          const Text(
            "\$2,241",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Text(
              "See Details",
              style: TextStyle(
                color: Colors.redAccent,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 10),


          SizedBox(
            height: 150,
            child: LineChart(
              LineChartData(
                gridData:  FlGridData(show: false),
                titlesData: FlTitlesData(
                  leftTitles:  AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles:  AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles:  AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 20,
                      getTitlesWidget: (value, meta) {
                        const titles = [
                          '10AM',
                          '11AM',
                          '12PM',
                          '01PM',
                          '02PM',
                          '03PM',
                          '04PM',
                        ];
                        int index = value.toInt();
                        if (index >= 0 && index < titles.length) {
                          return Text(
                            titles[index],
                            style: const TextStyle(fontSize: 10),
                          );
                        }
                        return const SizedBox();
                      },
                    ),
                  ),
                ),
                borderData: FlBorderData(show: false),
                minX: 0,
                maxX: 6,
                minY: 0,
                maxY: 6,
                lineBarsData: [
                  LineChartBarData(
                    isCurved: true,
                    color: Colors.redAccent,
                    barWidth: 3,
                    belowBarData: BarAreaData(
                      show: true,
                      color: Colors.orange.withOpacity(0.1),
                    ),
                    spots: const [
                      FlSpot(0, 2),
                      FlSpot(1, 3),
                      FlSpot(2, 1),
                      FlSpot(3, 4),
                      FlSpot(4, 3.5),
                      FlSpot(5, 5),
                      FlSpot(6, 4.8),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReviewCard() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Row(
            children: [
              Icon(Icons.star, color: Colors.redAccent),
              SizedBox(width: 6),
              Text(
                "4.9",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(width: 5),
              Text("Total 20 Reviews", style: TextStyle(color: Colors.grey)),
            ],
          ),
          Text(
            "See All Reviews",
            style: TextStyle(
              color: Colors.redAccent,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPopularSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Popular Items This Week",
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
        const SizedBox(height: 10),
        Row(
          children: [
            _buildPopularCard('images/chicken biryani.jpg', "Chicken Curry"),
            const SizedBox(width: 12),
            _buildPopularCard('images/pizza4.png', "Chef Special"),
          ],
        ),
      ],
    );
  }

  Widget _buildPopularCard(String imagePath, String name) {
    return Expanded(
      child: GestureDetector(
        onTap: (){
          Navigator.push(context,MaterialPageRoute(builder: (context)=>ChefFoodDetail()));
        },
        child: Container(
          height: 140,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
          alignment: Alignment.bottomLeft,
          padding: const EdgeInsets.all(8),
          child: Container(
            color: Colors.black.withOpacity(0.3),
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            child: Text(
              name,
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ),
      ),
    );
  }
}
