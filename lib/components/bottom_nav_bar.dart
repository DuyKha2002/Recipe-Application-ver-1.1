import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavBar extends StatefulWidget{
  final int SelectedItem;
  final Function(int) onTap;
  const BottomNavBar({super.key, required this.SelectedItem, required this.onTap});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar>{
  @override
  Widget build(BuildContext context) {
      final w=MediaQuery.of(context).size.width;
      final h=MediaQuery.of(context).size.height;
      return Container(
          padding: EdgeInsets.symmetric(horizontal: w*.01),
          child: GNav(
            gap: 10,
            tabBorderRadius: 100,
            backgroundColor: Colors.grey,
            activeColor: Colors.white,
            color: Colors.blue[600],
            tabBackgroundGradient: LinearGradient(
                colors: [
                  Colors.blue[400]!,
                  Colors.blueAccent.shade700
                ],
              begin: Alignment.topLeft,
              end: Alignment.topRight
            ),
            iconSize: 30,
            textSize: 18,
            padding: EdgeInsets.symmetric(
              horizontal: w*.01,
              vertical: h*.01
            ),
            tabs:const [
              GButton(icon: CupertinoIcons.home, text: 'Trang chủ',),
              GButton(icon: Icons.category, text: 'Danh mục',),
              GButton(icon: CupertinoIcons.square_favorites_alt_fill, text: 'Yêu thích',),
             // GButton(icon: CupertinoIcons.shopping_cart, text: 'Mua sắm',)
            ],
              onTabChange: widget.onTap,
            selectedIndex: 0,
          ),
      );
  }
}