import 'package:flutter/material.dart';
import 'package:food_pizza_hot/screen/addcard.dart';
import 'package:food_pizza_hot/screen/bottomnav.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  int selectedIndex = 2;
  final paymentMethods = [
    {'images': 'images/cash.png', 'label': 'Cash'},
    {'images': 'images/visa.png', 'label': 'Visa'},
    {'images': 'images/Mastercard.png', 'label': 'Mastercard'},
    {'images': 'images/paypal.png', 'label': 'Paypal'},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Container(
          margin:  EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context)=>Bottomnav()));},
            icon: Icon(Icons.arrow_back_ios, size: 18, color: Colors.black),
          ),
        ),
        title: Text(
          "Payment",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SafeArea(
          child: Column(
            children: [
              // Payment Method selector
              SizedBox(
                height: 90,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: paymentMethods.length,
                  itemBuilder: (context, index) {
                    final method = paymentMethods[index];
                    final isSelected = index == selectedIndex;
                    return GestureDetector(
                      onTap: () => setState(() => selectedIndex = index),
                      child: Container(
                        width: 90,
                        margin:  EdgeInsets.only(right: 12),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(16),
                          border: isSelected
                              ? Border.all(color: Colors.orange, width: 2)
                              : Border.all(color: Colors.transparent),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              method['images']!,
                              height: 36,
                              width: 36,
                              fit: BoxFit.contain,
                            ),
                             SizedBox(height: 8),
                            Text(
                              method['label']!,
                              style: TextStyle(
                                color: isSelected
                                    ? Colors.orangeAccent
                                    : Colors.black,
                                fontWeight: isSelected
                                    ? FontWeight.w600
                                    : FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

               SizedBox(height: 25),

              Container(
                padding:  EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Container(
                      height: 120,
                      width: 600,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image:  DecorationImage(
                          image: AssetImage("images/cardlogo.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                     SizedBox(height: 16),
                     Text(
                      "No master card added",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                     SizedBox(height: 6),
                     Text(
                      "You can add a mastercard and save it for later",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                  ],
                ),
              ),

               SizedBox(height: 20),

              Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.redAccent),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Addcard()),
                    );
                  },
                  icon:  Icon(Icons.add, color: Colors.redAccent),
                  label:  Text(
                    "ADD NEW",
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

               Spacer(),

              // Total & Pay Button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                  Text(
                    "TOTAL:",
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  Text(
                    "\$96",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "PAY & CONFIRM",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
