import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'Order.dart';
import 'cart.dart';
import 'home.dart';
import 'payment..dart';
import 'profile.dart';

class Bottomnav extends StatefulWidget {
  const Bottomnav({super.key});

  @override
  State<Bottomnav> createState() => _BottomnavState();
}

class _BottomnavState extends State<Bottomnav> {
  int currentTabIndex = 0;
  late List<Widget> pages;
  late Widget currentpage;
  late Home home;
  late Order order;
  late Payment payment;

  late Profile profile;

  @override
  void initState() {
    home = Home();
    order = Order();

    payment = Payment();
    profile = Profile();
    pages = [home, order, payment, profile];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 60,
        backgroundColor: Colors.white,
        color: Colors.redAccent,
        animationDuration: Duration(milliseconds: 500),
        onTap: (int index){
          setState(() {
            currentTabIndex =index;
          });
        },
        items: [
          Icon(Icons.home_outlined, color: Colors.white),

          Icon(Icons.reorder, color: Colors.white),
          Icon(Icons.wallet, color: Colors.white),
          Icon(Icons.person, color: Colors.white,)
        ],
      ),
      body: pages[currentTabIndex],
    );
  }
}
