import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:hive_flutter/adapters.dart';
import 'package:thflutter/components/custom_clip_path.dart';
import 'package:thflutter/constants/circle_button.dart';
import 'package:thflutter/constants/share.dart';
import 'package:thflutter/constants/show_detail_dialog.dart';
import 'package:thflutter/constants/show_table.dart';
import 'package:thflutter/constants/start_cooking.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../components/ingredient_list.dart';

class DetailScreen extends StatefulWidget {

  final Map<String,dynamic> item;
  const DetailScreen({Key? key, required this.item}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    var myBox=Hive.box('saved');
    final h=MediaQuery.of(context).size.height;
    final w=MediaQuery.of(context).size.width;
    String time = widget.item['totalTime'].toString();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: h*.44,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage(widget.item['image']),fit: BoxFit.cover)
                  ),
                ),
                Positioned(
                  top: h*.04, left: w*.05,
                    child: const CircleAvatar(
                      backgroundColor: Colors.redAccent,
                      child: BackButton(color: Colors.white,),
                    ),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.symmetric(horizontal: w*.04),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20,),
                  Text(widget.item['label'],
                    style: TextStyle(
                      fontSize: w*.05,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 1,),
                  Text("$time min"),
                  SizedBox(height: h*.01,),

                    Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap:(){
                            // ShareRecipe.share(widget.item['url']);
                        },
                        child: const CircleButton(
                          icon: Icons.share, label: 'Chia sẻ',
                        ),
                      ),
                      ValueListenableBuilder(
                          valueListenable: myBox.listenable(),
                          builder: (context,box,_){
                            String key = widget.item['label'];
                            bool saved=myBox.containsKey(key);
                            if(saved){
                              return GestureDetector(
                                onTap: (){
                                  myBox.delete(key);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          duration: Duration(seconds: 1),
                                          content: Text('Recipe deleted'))
                                  );
                                },
                                  child: Icon(Icons.favorite_border));
                            }
                            else{
                              return  GestureDetector(
                                onTap: (){
                                  myBox.put(key, key);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                  const    SnackBar(
                                      duration: Duration(seconds: 1),
                                      content: Text('Recipe saved'))
                                  );
                                },
                                child: CircleButton(
                                  icon: Icons.favorite, label: 'Yêu thích',
                                ),
                              );
                            }
                          }),

                      GestureDetector(
                        onTap: (){
                          ShowDialog.showCalories(widget.item['totalNutrients'], context);
                        },
                        child: const CircleButton(
                          icon: Icons.monitor_heart_outlined, label: 'Danh mục',
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          ShowTable.showTable(context);
                        },
                        child: const CircleButton(
                          icon: Icons.table_chart_outlined, label: 'Ước lượng',
                        ),
                      ),

                    ],
                  ),
                  SizedBox(height: h*.02,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Công thức', style: TextStyle(fontWeight: FontWeight.bold, fontSize: w*.06),),
                      SizedBox(width: w*.34,
                      child: ElevatedButton(onPressed: (){
                        StartCooking.startCooking(widget.item['url']);
                      },
                      child: const Text('Bắt đầu'),),),
                    ],
                  ),

                  SizedBox(height: h*.02,),

                  Container(
                    height: h*.07,
                    width: w,
                    color: Colors.white,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                            child: ClipPath(
                              clipper: CustomClipPath(),
                          child: Container(
                            color: Colors.redAccent,
                            child: Center(
                              child: Text('Nguyên liệu cần thiết',
                              style: TextStyle(fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: w*.05,
                              ),
                              ),
                            ),
                          ),
                        )),
                        // Expanded(
                        //   flex: 1,
                        //     child: Container(
                        //       color: Colors.grey,
                        //       child: const Center(
                        //         child: Text('Items'),
                        //       ),
                        // )),
                      ],
                    ),
                  ),
                  SizedBox(height: h*1.8,
                  child: IngredientList(
                    ingredients: widget.item['ingredients'],

                  ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

