import 'package:flutter/material.dart';
import 'package:food/screen/home.dart'; // Import HomeScreen
import 'package:food/screen/firstpage.dart'; // Import FirstPage
import 'package:food/screen/itempage.dart'; // Import ItemPage

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  // List of pages for navigation
  final List<Widget> _pages = [
    HomeScreen(), // HomeScreen is the first page
    ItemPage(), // Add another page (e.g., ItemPage)
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Method to show FirstPage as a full-screen modal
  void _showFirstPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FirstPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list), // Add another item
            label: "Item Page",
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showFirstPage(context), // Navigate to FirstPage
        child: Icon(Icons.add), // Icon for the FAB
        tooltip: "Open First Page", // Tooltip for the FAB
      ),
    );
  }
}