
import 'package:flutter/material.dart';
import 'package:food/screens/logoutScreen.dart';

import '../config/theme.dart';
import '../models/navModel.dart';
import '../screens/calorieCalculatorScreen.dart';
import '../screens/estimateCaloriesPage.dart';
import '../screens/foodCaloriHistory.dart';
import '../screens/homeScreen.dart';
import '../widget/customAppBar.dart';
import '../widget/customBottomNavBar.dart';

class AuthLayout extends StatefulWidget {
  const AuthLayout({super.key});

  @override
  State<AuthLayout> createState() => _AuthLayoutState();
}

class _AuthLayoutState extends State<AuthLayout> {

  final homeNavKey = GlobalKey<NavigatorState>();
  final calculatorNavKey = GlobalKey<NavigatorState>();
  final historyNavKey = GlobalKey<NavigatorState>();
  final tipsNavKey = GlobalKey<NavigatorState>();
  final logoutNavKey = GlobalKey<NavigatorState>();
  int selectedTab = 0;
  List<NavModel> items = [];

@override
void initState() {
  super.initState();
  items = [
    NavModel(
      navKey: homeNavKey,
      page: const Homescreen(),
      title: "Home",
    ),
    NavModel(
      navKey: calculatorNavKey,
      page: const Caloriecalculator(),
      title: "Calorie Calculator",
    ),
    NavModel(
      navKey: tipsNavKey,
      page: const EstimateCaloriesPage(),
      title: "Food Log",
    ),
  ];
}

@override
  Widget build(BuildContext context) {
    final appBarTitle = items.isNotEmpty ? items[selectedTab].title : "Default Title";
    
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: CustomAppBar(
            title: appBarTitle,
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            color: typographyAltPrimary,
          ),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: IndexedStack(
                index: selectedTab,
                children: items
                  .map((page) => Navigator(
                        key: page.navKey,
                        onGenerateInitialRoutes: (navigator, initialRoute) {
                          return [
                            MaterialPageRoute(builder: (context) => page.page)
                          ];
                        },
                      ))
                  .toList(),
              ),
            ),
        ),
        bottomNavigationBar: CustomBottomNavBar(
          initialIndex: 0,
          onTap: (index) {
            if (index == selectedTab) {
              items[index].navKey.currentState
                  ?.popUntil((route) => route.isFirst);
            } else {
              setState(() {
                selectedTab = index;
              });
            }
          }
        )
      ),
    );
  }
}