
import 'package:flutter/material.dart';

import '../config/theme.dart';
import '../widget/carouselSlider.dart';
import '../widget/customGreetingCard.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {

  final List<dynamic> items = [
    {
      "image_path": "assets/images/calorie_calculator.jpg",
      "title": "Calorie Calculator",
      "description": "Easily calculate the calories of meals and snacks using our calorie calculator."
    },
    {
      "image_path": "assets/images/food_log.jpg",
      "title": "Food Log",
      "description": "Track your daily food intake with predefined food entries to maintain a healthy calorie count."
    },
    {
      "image_path": "assets/images/history.jpg",
      "title": "Weekly Calorie History",
      "description": "View your total calorie consumption for the past 7 days and monitor your progress."
    },
  ];

  final String userName = "Kamal";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello, $userName!',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: primaryMain,
                  ),
                ),
                Text(
                  'Welcome back',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: primaryMain, // Or your preferred color
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  const SizedBox(height: 20.0),
                  Carousel(
                    items: items,
                  ),
                  const SizedBox(height: 20),
                  CustomGreetinCard(
                    cardTitle: 'Track & Improve', 
                    cardSubtitle: 'Stay consistent and monitor your calories daily for better health.',
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
