import 'package:flutter/material.dart';

class CustomGreetinCard extends StatefulWidget {
  const CustomGreetinCard({super.key, required this.cardTitle , required this.cardSubtitle});

  final String cardTitle;
  final String cardSubtitle;

  @override
  State<CustomGreetinCard> createState() => _CustomGreetinCardState();
}

class _CustomGreetinCardState extends State<CustomGreetinCard> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.album),
              title: Text(widget.cardTitle),
              subtitle: Text(widget.cardSubtitle),
            ),
          ],
        ),
      ),
    );
  }
}
