import 'package:flutter/material.dart';

class ItemPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Item Page"),
      ),
      body: Center(
        child: Text(
          "This is the Item Page",
          style: TextStyle(fontSize: 20, color: Colors.blue),
        ),
      ),
    );
  }
}