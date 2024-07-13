import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:thflutter/models/food.dart';
import 'package:thflutter/widget/appBar_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with SingleTickerProviderStateMixin{
  late TabController _tabController;
  final DatabaseReference database = FirebaseDatabase.instance.ref();
  List<Food> dataList = [];
  @override
  void initState() {
    // Thêm vào bảng  recipes và liked vào firebase RealTime
    // for (var food in foods) {
    //   database.child("liked").push().set(food.toMap());
    // }
    ////// Ban đầu TabBar ở index 0 nên cần load bảng recipes
    dataList = [];
    fetchdataList('recipes');
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      if(_tabController.index == 0){
        dataList = [];
        fetchdataList('recipes');
      }
      if(_tabController.index == 1){
        fetchdataList('liked');
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }


  void fetchdataList(String table) async {
    database.child(table).once().then((DatabaseEvent event) {
      DataSnapshot snapshot = event.snapshot;
      var data = snapshot.value as Map<dynamic, dynamic>;
      List<Food> listRecipes = [];
      data.values.forEach((element) {
        if (element is Map<dynamic, dynamic>) { // Check if element is a map
          Food item = Food.fromMap(Map<String, dynamic>.from(element));
          listRecipes.add(item); // Assuming dataList is declared somewhere in your class
        }
      });
      setState(() {
        dataList = listRecipes;
      });
    }).catchError((error) {
      print("Failed to load data: $error");
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: "Profile"),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            /// Avt & Info
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        const CircleAvatar(
                          radius: 50,
                          backgroundImage:  AssetImage("assets/images/avatar.jpg")
                        ),
                        InkWell(
                          onTap: (){
      
                          },
                          child: const CircleAvatar(
                            radius: 12,
                            child:  Icon(Icons.edit,size: 20,),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("User 1",style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),)
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("50",style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text("Recipes",style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                color: Colors.grey,
                              ),
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("50",style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text("Following",style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                color: Colors.grey,
                              ),
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("50",style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text("Followers",style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                color: Colors.grey,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: (){
                    
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width- 60,
                    height: (MediaQuery.of(context).size.width - 60) / 8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.green.shade400,
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Follow",style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            TabBar(
              indicatorColor: Colors.blue,
              isScrollable: true,
              labelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.black),
              labelColor: Colors.blue,
              unselectedLabelColor: Colors.black,
              controller: _tabController,
              tabs:  [
                SizedBox(
                  width: (MediaQuery.of(context).size.width/2)-60,
                  child:const  Tab(text: 'Recipes')
                ),
                 SizedBox(
                  width: (MediaQuery.of(context).size.width/2)-60,
                  child:const Tab(text: 'Liked')
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: <Widget> [
                 listViewData(context),
                 listViewData(context)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  SingleChildScrollView listViewData(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Wrap(
            children: List.generate(dataList.length, (index) => 
              Container(
                width: (MediaQuery.of(context).size.width/2)-30,
                padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              dataList[index].avtUser ?? "", // URL of the image
                              height: 40,
                              width: 40,
                              fit: BoxFit.cover, // Optional: adjust this based on your image aspect ratio requirements
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(dataList[index].nameUser ?? "",style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(8), 
                      child: Image.asset(
                        dataList[index].image,
                        height: 150,
                        fit: BoxFit.cover, 
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      dataList[index].name,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Icon(
                          Iconsax.clock,
                          size: 18,
                          color: Colors.grey,
                        ),
                        Text(
                          "${dataList[index].time} Min",
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}