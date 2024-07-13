import 'package:flutter/material.dart';
import 'package:thflutter/components/bottom_nav_bar.dart';
import 'package:thflutter/screens/home_screen.dart';
import 'package:thflutter/screens/recipe_category.dart';
import 'package:thflutter/screens/save_screen.dart';
import 'package:thflutter/screens/shopping_screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late PageController pageController;
  int currentIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController(initialPage: currentIndex);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(onTap: (index){
      pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut
      );
      setState(() {
        currentIndex=index;
      });
      },
        SelectedItem: currentIndex,
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (index){
          setState(() {
            currentIndex=index;
          });
        },
        physics: const NeverScrollableScrollPhysics(),
        children:const [
          HomePage(),
          RecipeCategory(),
          SavedScreen(),
          ShoppingScreen(),
          // Center(child: Text('Page 5'),),
        ],
      ),

    );
  }
}



