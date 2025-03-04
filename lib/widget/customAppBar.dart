// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:food/users/login.dart';

import '../config/theme.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({
    super.key,
    required this.title,
  });

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text(widget.title),
      backgroundColor: primaryMain,
      foregroundColor: typographyAltPrimary,
      actions: [
        IconButton(
          onPressed: () {
            Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
          );
          },
          icon: const Icon(Icons.logout),
        ),
      ],
    );
  }
}
