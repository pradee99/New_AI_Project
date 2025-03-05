// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Logoutscreen extends StatefulWidget {
  const Logoutscreen({super.key});

  @override
  State<Logoutscreen> createState() => _LogoutscreenState();
}

class _LogoutscreenState extends State<Logoutscreen> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
      },
      child: Text("Logout"),
    );
  }
}
