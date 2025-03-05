import 'package:flutter/material.dart';
import '../config/theme.dart';


class Custombutton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final IconData? icon;
  const Custombutton({super.key , required this.text , required this.onPressed , this.icon});

  @override
  State<Custombutton> createState() => _CustombuttonState();
}

class _CustombuttonState extends State<Custombutton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16),
        backgroundColor: primaryDark,
        foregroundColor: typographyAltPrimary,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        minimumSize: const Size(double.infinity, 50),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min, // Prevent full width stretching
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (widget.icon != null) ...[
            Icon(widget.icon, size: 22, color: typographyAltPrimary), // Display icon
            const SizedBox(width: 10), // Spacing between icon and text
          ],
          Text(
            widget.text,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}