import 'package:flutter/material.dart';
//import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';
class IngredientItem extends StatelessWidget {
  final String quantity, measure, food;
  // imageUrl

  const IngredientItem({
    Key? key,
    required this.quantity,
    required this.measure,
    required this.food,
   // required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    var myBox=Hive.box('shopping');
    return Container(
      margin: EdgeInsets.symmetric(vertical: h * .01, horizontal: w * .033),
      padding: EdgeInsets.only(
        top: h * .008,
        bottom: h * .008,
        left: h * .008,
        right: h * .08,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.2),
            blurRadius: 5,
            spreadRadius: 2,
            offset: const Offset(0, 3),
          )
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            // child: Image.network(
            //   imageUrl,
            //   width: w * .2,
            //   height: h * .1,
            //   fit: BoxFit.cover,
            // ),
          ),
          SizedBox(width: w * .033),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  food,
                  style: TextStyle(
                    fontSize: w * .04,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
                Text(
                  "$quantity $measure",
                  style: TextStyle(
                    fontSize: w * .04,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: w * .033),
          ValueListenableBuilder(
            valueListenable: myBox.listenable(),
            builder: (context,box,_){
              bool exist=box.containsKey(food);
              if (exist){
                return GestureDetector(
                  onTap: (){
                    myBox.delete(food);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('item deleted'))
                    );
                  },
                    child: Icon(Icons.done, color: Colors.green,size: w*.07,));
              }
             else {
                return GestureDetector(
                  onTap: (){
                    String value = '$food $measure $quantity';
                    myBox.put(food, value);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('item add successfully'))
                    );
                  },
                  child: Icon(
                  Icons.add_circle_outline_rounded, size: w * .07, color: Colors.redAccent,
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}