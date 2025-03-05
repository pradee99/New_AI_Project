import 'package:flutter/cupertino.dart';

class NavModel {
  final Widget page;
  final GlobalKey<NavigatorState> navKey;
  final String title;
  
  NavModel({
    required this.navKey,
    required this.page,
    required this.title,
  });
}
