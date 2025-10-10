// import 'package:flutter/material.dart';
//
// class PizzaDetailsScreen extends StatefulWidget {
//   const PizzaDetailsScreen({super.key});
//
//   @override
//   State<PizzaDetailsScreen> createState() => _PizzaDetailsScreenState();
// }
//
// class _PizzaDetailsScreenState extends State<PizzaDetailsScreen> {
//   int selectedSizeIndex = 1; // default: 14"
//   int quantity = 2;
//
//   final List<String> sizes = ['10"', '14"', '16"'];
//   final List<IconData> ingredients = [
//     Icons.local_drink, // placeholder for sauce
//     Icons.egg,         // placeholder for egg
//     Icons.ring_volume, // placeholder for onion
//     Icons.set_meal,    // placeholder for meat
//     Icons.dinner_dining, // placeholder for cheese
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // 🔙 AppBar Section
//               Row(
//                 children: [
//                   CircleAvatar(
//                     backgroundColor: Colors.grey.shade200,
//                     child: IconButton(
//                       onPressed: () {
//                         Navigator.pop(context);
//                       },
//                       icon: const Icon(Icons.arrow_back_ios, size: 18),
//                     ),
//                   ),
//                   const SizedBox(width: 15),
//                   const Text(
//                     'Details',
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 25),
//
//               // 🍕 Pizza Image Card
//               Container(
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   color: const Color(0xFFFFE4C7),
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: Stack(
//                   alignment: Alignment.topRight,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(20.0),
//                       child: Image.asset(
//                         'assets/pizza.png', // Add your pizza image
//                         height: 180,
//                       ),
//                     ),
//                     Positioned(
//                       bottom: 15,
//                       right: 15,
//                       child: CircleAvatar(
//                         backgroundColor: Colors.white.withOpacity(0.6),
//                         radius: 18,
//                         child: const Icon(
//                           Icons.favorite_border,
//                           color: Colors.orange,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//
//               const SizedBox(height: 20),
//
//               // ☕ Restaurant Name
//               Row(
//                 children: [
//                   const Icon(
//                     Icons.local_pizza_outlined,
//                     color: Colors.orange,
//                     size: 22,
//                   ),
//                   const SizedBox(width: 6),
//                   Text(
//                     'Uttora Coffee House',
//                     style: TextStyle(
//                       color: Colors.grey.shade600,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ],
//               ),
//
//               const SizedBox(height: 10),
//
//               // 🍕 Pizza Name
//               const Text(
//                 'Pizza Calzone European',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 18,
//                 ),
//               ),
//
//               const SizedBox(height: 5),
//
//               const Text(
//                 'Prosciutto e funghi is a pizza variety that is topped with tomato sauce.',
//                 style: TextStyle(
//                   color: Colors.grey,
//                   fontSize: 13,
//                 ),
//               ),
//
//               const SizedBox(height: 20),
//
//               // ⭐ Rating Row
//               Row(
//                 children: [
//                   const Icon(Icons.star, color: Colors.orange, size: 18),
//                   const SizedBox(width: 4),
//                   const Text('4.7'),
//                   const SizedBox(width: 20),
//                   const Icon(Icons.local_shipping, color: Colors.orange, size: 18),
//                   const SizedBox(width: 4),
//                   const Text('Free'),
//                   const SizedBox(width: 20),
//                   const Icon(Icons.access_time, color: Colors.orange, size: 18),
//                   const SizedBox(width: 4),
//                   const Text('20 min'),
//                 ],
//               ),
//
//               const SizedBox(height: 25),
//
//               // 🔘 Size Selector
//               const Text(
//                 'SIZE:',
//                 style: TextStyle(
//                   fontWeight: FontWeight.w600,
//                   color: Colors.grey,
//                   fontSize: 14,
//                 ),
//               ),
//               const SizedBox(height: 10),
//               Row(
//                 children: List.generate(sizes.length, (index) {
//                   bool isSelected = selectedSizeIndex == index;
//                   return GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         selectedSizeIndex = index;
//                       });
//                     },
//                     child: Container(
//                       margin: const EdgeInsets.only(right: 12),
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 18, vertical: 10),
//                       decoration: BoxDecoration(
//                         color: isSelected
//                             ? Colors.orange
//                             : Colors.grey.shade200,
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       child: Text(
//                         sizes[index],
//                         style: TextStyle(
//                           color: isSelected ? Colors.white : Colors.grey.shade700,
//                           fontWeight:
//                           isSelected ? FontWeight.bold : FontWeight.normal,
//                         ),
//                       ),
//                     ),
//                   );
//                 }),
//               ),
//
//               const SizedBox(height: 25),
//
//               // 🍄 Ingredients Section
//               const Text(
//                 'INGREDIENTS',
//                 style: TextStyle(
//                   fontWeight: FontWeight.w600,
//                   color: Colors.grey,
//                   fontSize: 14,
//                 ),
//               ),
//               const SizedBox(height: 10),
//               Row(
//                 children: List.generate(ingredients.length, (index) {
//                   return Container(
//                     margin: const EdgeInsets.only(right: 10),
//                     padding: const EdgeInsets.all(10),
//                     decoration: BoxDecoration(
//                       color: Colors.orange.shade50,
//                       shape: BoxShape.circle,
//                     ),
//                     child: Icon(
//                       ingredients[index],
//                       color: Colors.orange,
//                       size: 20,
//                     ),
//                   );
//                 }),
//               ),
//
//               const Spacer(),
//
//               // 💲 Price and Quantity Section
//               Container(
//                 padding:
//                 const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
//                 decoration: BoxDecoration(
//                   color: Colors.grey.shade100,
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     const Text(
//                       '\$32',
//                       style: TextStyle(
//                         fontSize: 22,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     Container(
//                       decoration: BoxDecoration(
//                         color: Colors.black,
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       child: Row(
//                         children: [
//                           IconButton(
//                             onPressed: () {
//                               setState(() {
//                                 if (quantity > 1) quantity--;
//                               });
//                             },
//                             icon: const Icon(Icons.remove, color: Colors.white),
//                           ),
//                           Text(
//                             '$quantity',
//                             style: const TextStyle(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 16),
//                           ),
//                           IconButton(
//                             onPressed: () {
//                               setState(() {
//                                 quantity++;
//                               });
//                             },
//                             icon: const Icon(Icons.add, color: Colors.white),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//
//               const SizedBox(height: 20),
//
//               // 🛒 Add to Cart Button
//               SizedBox(
//                 width: double.infinity,
//                 height: 55,
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.orange,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                   ),
//                   onPressed: () {},
//                   child: const Text(
//                     'ADD TO CART',
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                       fontSize: 16,
//                     ),
//                   ),
//                 ),
//               ),
//
//               const SizedBox(height: 20),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  int selectedIndex = 2;

  final paymentMethods = [
    {'image': 'assets/images/cash.png', 'label': 'Cash'},
    {'image': 'assets/images/visa.png', 'label': 'Visa'},
    {'image': 'assets/images/mastercard.png', 'label': 'Mastercard'},
    {'image': 'assets/images/paypal.png', 'label': 'Paypal'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, size: 18, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        title: const Text(
          "Payment",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                      margin: const EdgeInsets.only(right: 12),
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
                            method['image']!,
                            height: 36,
                            width: 36,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            method['label']!,
                            style: TextStyle(
                              color: isSelected ? Colors.black : Colors.grey,
                              fontWeight:
                              isSelected ? FontWeight.w600 : FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 25),

            // Card Info Section
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Container(
                    height: 120,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: const DecorationImage(
                        image: AssetImage("assets/images/card_placeholder.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "No master card added",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    "You can add a mastercard and save it for later",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Add New Button
            Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.orange),
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add, color: Colors.orange),
                label: const Text(
                  "ADD NEW",
                  style: TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),

            const Spacer(),

            // Total & Pay Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "TOTAL:",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
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
                  backgroundColor: Colors.orange,
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
    );
  }
}
