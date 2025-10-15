import 'package:flutter/material.dart';

class ChefReview extends StatelessWidget {
  const ChefReview({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> reviews = [
      {
        "name": "Great Food and Service",
        "rating": 5,
        "date": "20/12/2020",
        "review":
            "This Food so tasty & delicious. Breakfast so fast Delivered in my place. Chef is very friendly. I'm really like chef for Home Food Order. Thanks.",
        "images": "images/boy.jpg",
      },
      {
        "name": "Awesome and Nice",
        "rating": 4,
        "date": "20/12/2020",
        "review":
            "This Food so tasty & delicious. Breakfast so fast Delivered in my place.",
        "images": "images/boy.jpg",
      },
      {
        "name": "Awesome and Nice",
        "rating": 4,
        "date": "20/12/2020",
        "review": "This Food so tasty & delicious.",
        "images": "images/boy.jpg",
      },
      {
        "name": "Awesome and Nice",
        "rating": 4,
        "date": "20/12/2020",
        "review":
            "This Food so tasty & delicious. Breakfast so fast Delivered in my place.",
        "images": "images/boy.jpg",
      },
      {
        "name": "Awesome and Nice",
        "rating": 4,
        "date": "20/12/2020",
        "review":
            "This Food so tasty & delicious. Breakfast so fast Delivered in my place.",
        "images": "images/boy.jpg",
      },
    ];

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey.shade200,
                    child: IconButton(
                      icon:  Icon(
                        Icons.arrow_back_ios_new,
                        size: 18,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                   SizedBox(width: 15),
                   Text(
                    "Reviews",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),

             SizedBox(height: 10),

            Expanded(
              child: ListView.builder(
                padding:  EdgeInsets.symmetric(horizontal: 16),
                itemCount: reviews.length,
                itemBuilder: (context, index) {
                  final item = reviews[index];
                  return Container(
                    margin:  EdgeInsets.only(bottom: 16),
                    padding:  EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 14,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 22,
                              backgroundImage: AssetImage(item['images']),
                            ),
                             SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item['date'],
                                    style: TextStyle(
                                      color: Colors.grey.shade500,
                                      fontSize: 12,
                                    ),
                                  ),
                                   SizedBox(height: 4),
                                  Text(
                                    item['name'],
                                    style:  TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  ),
                                   SizedBox(height: 6),
                                  _buildStars(item['rating']),
                                ],
                              ),
                            ),
                             Icon(Icons.more_vert, color: Colors.grey),
                          ],
                        ),

                         SizedBox(height: 10),
                        Text(
                          item['review'],
                          style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: 13,
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStars(int rating) {
    return Row(
      children: List.generate(5, (index) {
        return Icon(
          index < rating ? Icons.star : Icons.star_border,
          color: Colors.orange,
          size: 16,
        );
      }),
    );
  }
}
