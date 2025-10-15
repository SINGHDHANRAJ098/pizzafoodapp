import 'package:flutter/material.dart';
import 'package:food_pizza_hot/chef_screen/chef_review.dart';
import 'package:food_pizza_hot/chef_screen/withdraw.dart';
import 'package:food_pizza_hot/screen/login.dart';

class Chefprofile extends StatefulWidget {
  const Chefprofile({super.key});

  @override
  State<Chefprofile> createState() => _ChefprofileState();
}

class _ChefprofileState extends State<Chefprofile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.redAccent,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
            padding: EdgeInsets.only(top: 20, right: 20, left: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        size: 16,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "My Profile",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  "Available Balance",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  "\$500.00",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 40,
                  width: 150,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Withdraw()),
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.white, width: 2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      "Withdraw",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 16),
              children: [
                _buildMenuItem(
                  icon: Icons.person_outline,
                  title: "Personal Info",
                  onTap: () {},
                ),
                _buildMenuItem(
                  icon: Icons.settings_outlined,
                  title: "Settings",
                  onTap: () {},
                ),
                _buildMenuItem(
                  icon: Icons.history,
                  title: "Withdrawal History",
                  onTap: () {},
                ),
                _buildMenuItem(
                  icon: Icons.list_alt_outlined,
                  title: "Number of Orders",
                  trailingText: "29K",
                  onTap: () {},
                ),
                _buildMenuItem(
                  icon: Icons.reviews_outlined,
                  title: "User Reviews",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChefReview()),
                    );
                  },
                ),
                _buildMenuItem(
                  icon: Icons.logout,
                  title: "Log Out",
                  iconColor: Colors.red,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    String? trailingText,
    Color? iconColor,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin:  EdgeInsets.only(bottom: 15),
        padding:  EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundColor: Colors.white,
              child: Icon(
                icon,
                color: iconColor ?? Colors.deepOrange,
                size: 20,
              ),
            ),
             SizedBox(width: 12),
            Expanded(child: Text(title, style:  TextStyle(fontSize: 15))),
            if (trailingText != null)
              Text(
                trailingText,
                style:  TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
             Icon(Icons.chevron_right, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
