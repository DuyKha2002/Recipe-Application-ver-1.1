// import 'package:flutter/material.dart';
// import 'package:recipe/models/food.dart';
// import 'package:recipe/widgets/food_card.dart';
// import 'package:recipe/widgets/favorite_screen_appbar.dart';
//
// import '../models/food.dart';
//
// class FavoriteScreen extends StatelessWidget {
//   const FavoriteScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final List<Food> favoriteFoods = foods.where((food) => food.isLiked).toList();
//
//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(15),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const FavoriteScreenAppbar(),
//                 const SizedBox(height: 20),
//                 GridView.builder(
//                   shrinkWrap: true,
//                   physics: const NeverScrollableScrollPhysics(),
//                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2,
//                     crossAxisSpacing: 20,
//                     mainAxisSpacing: 20,
//                   ),
//                   itemBuilder: (context, index) => FoodCard(
//                     food: favoriteFoods[index],
//                   ),
//                   itemCount: favoriteFoods.length,
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
