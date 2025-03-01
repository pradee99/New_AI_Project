import 'package:flutter/material.dart';
import 'package:food/screen//firstpage.dart'; // Import the first page

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: Center(
        child: Text(
          "Welcome to Home Page!",
          style: TextStyle(fontSize: 20),
        ),
      ),

      // Floating Action Button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FirstPage()),
          );
        },
        child: Icon(Icons.add), // Icon for navigation
        tooltip: "Go to First Page",
      ),
    );
  }
}
