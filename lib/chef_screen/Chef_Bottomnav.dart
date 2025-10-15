import 'package:flutter/material.dart';
import 'package:food_pizza_hot/chef_screen/Chef_home.dart';
import 'package:food_pizza_hot/chef_screen/Chef_notification.dart';
import 'package:food_pizza_hot/chef_screen/Chefprofile.dart';
import 'package:food_pizza_hot/chef_screen/addfooditem.dart';
import 'package:food_pizza_hot/chef_screen/foodlist.dart';

class ChefBottomnav extends StatefulWidget {
  const ChefBottomnav({super.key});

  @override
  State<ChefBottomnav> createState() => _ChefBottomnavState();
}

class _ChefBottomnavState extends State<ChefBottomnav> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    ChefHome(),
    Foodlist(),
    Addfooditem(),
    ChefNotification(),
    Chefprofile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            selectedItemColor: Colors.redAccent,
            unselectedItemColor: Colors.grey,
            selectedLabelStyle: TextStyle(fontSize: 12),
            unselectedLabelStyle: TextStyle(fontSize: 12),
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.grid_view),
                activeIcon: Icon(Icons.grid_view),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.list),
                activeIcon: Icon(Icons.list_outlined),
                label: 'List',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add_outlined),
                activeIcon: Icon(Icons.add),
                label: 'Add Food',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notifications_active),
                activeIcon: Icon(Icons.notifications),
                label: 'Message',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outlined),
                activeIcon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
