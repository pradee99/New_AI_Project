
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import '../config/theme.dart';
class CustomBottomNavBar extends StatefulWidget {
  final int initialIndex;
  final ValueChanged<int> onTap;
  const CustomBottomNavBar({
    super.key,
    required this.initialIndex,
    required this.onTap,
  });
  @override
  // ignore: library_private_types_in_public_api
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}
class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  late int _currentIndex;
  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }
  void _handleTap(int index) {
    setState(() {
      _currentIndex = index;
    });
    widget.onTap(index);
  }
  @override
  Widget build(BuildContext context) {
    return StyleProvider(
      style: Style(),
      child: ConvexAppBar(
        top: 0,
        height: 50,
        style: TabStyle.fixed,
        backgroundColor: primaryMain,
        activeColor: typographyAltPrimary,
        color: typographyPlaceholder,
        elevation: 0,
        curveSize: 60,
        cornerRadius: 16,
        curve: Curves.bounceInOut,
        
        items: const [
          TabItem(
            icon: Icons.home,
            title: 'Home',
          ),
          TabItem(
            icon: Icons.calculate,
            title: 'Calculator',
          ),
           TabItem(
            icon: Icons.list_alt,
            title: 'Food Log',
          ),
        ],
        initialActiveIndex: _currentIndex,
        onTap: _handleTap,
      ),
    );
  }
}
class Style extends StyleHook {
  @override
  double get activeIconSize => 24;
  @override
  double get activeIconMargin => 35;
  @override
  double get iconSize => 24;
  @override
  TextStyle textStyle(Color color, String? fontFamily) {
    return TextStyle(fontSize: 12, color: color);
  }
}