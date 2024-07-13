import 'package:flutter/material.dart';
import 'package:thflutter/components/drawer/my_drawer.dart';
import 'package:thflutter/constants/images_path.dart';
import '../components/home_app_bar.dart';
import '../components/tab_bar_widget.dart';
import '../components/text_field_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final w=MediaQuery.of(context).size.width;
    final h=MediaQuery.of(context).size.height;
    return Scaffold(

      // Dark - Light mode
      backgroundColor: Theme.of(context).colorScheme.surface,


      appBar: AppBar(title: Text("Trang chủ"),),
      drawer: MyDrawer(),
      body: SafeArea(child: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HomeAppBar(),
              SizedBox(
                height: h*.022,
            ),
                TextFieldWidget(),
                SizedBox(
                  height: h*.022,
                ),
                Container(
                  height: h*.25,
                  width: w,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(ImagesPath.explore),
                        fit: BoxFit.fill
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                SizedBox(height: h*.023,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Danh mục', style: TextStyle(
                      fontSize: w*.045,
                      fontWeight: FontWeight.bold,
                    ),),
                   // const Text('See all'),
                    SizedBox(
                      width: w*.022,
                    ),
                  ],
                ),
                SizedBox(height: h*.022,),

               const TabBarWidget(

                )
              ],
            ),
        ),
      )),
    );
  }
}

