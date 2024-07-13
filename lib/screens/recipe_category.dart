import 'package:flutter/material.dart';
import 'package:thflutter/components/category_list.dart';
import 'package:thflutter/screens/all_recipe.dart';

import '../components/recipre_category_view.dart';

class RecipeCategory extends StatelessWidget {
  const RecipeCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final h=MediaQuery.of(context).size.height;
    final w=MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(.1),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: w*.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: h*.06,),
            Text('Món ăn theo buổi', style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: w*.06,
            ),),
            SizedBox(height: h*.01,),
            SizedBox(
              height: h*.106,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RecipreCategoryView(name: name[0],image: image[0],),
                  RecipreCategoryView(name: name[1],image: image[1],),
                  RecipreCategoryView(name: name[2],image: image[2],),
                  RecipreCategoryView(name: name[3],image: image[3],),
                ],
              ),
            ),
            SizedBox(height: h*.01,),
            Text('Món ăn yêu thích',style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: w*.055,
            ),),
            SizedBox(
              height: h*.45,
              child: GridView.builder(
                itemCount: categories.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: h*.01,
                  mainAxisSpacing: w*.043,
                ),
                itemBuilder: (context,index){
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>AllRecipe(reipe: categories[index],))
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: h*.043,width: w*.08,
                              child: Image.asset(categoryImage[index]),
                            ),
                            SizedBox(height: h*.003,),
                            Text(categories[index],style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black45,
                            ),),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: h*.02,),
            Text('Sở thích', style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: w*.055,
            ),),
            SizedBox(height: h*.13,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RecipreCategoryView(name: 'Ease', image: image[0]),
                  RecipreCategoryView(name: 'Quick', image: image[1]),
                  RecipreCategoryView(name: 'Beef', image: image[2]),
                  RecipreCategoryView(name: 'Low fat', image: image[3]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
