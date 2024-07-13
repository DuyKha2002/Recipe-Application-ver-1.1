import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ionicons/ionicons.dart';
import 'package:thflutter/app_state.dart';
import 'package:thflutter/components/setting/setting_item.dart';
import 'package:thflutter/components/setting/setting_switch.dart';
import 'package:thflutter/screens/profile_screen.dart';
import 'package:thflutter/widget/appBar_widget.dart';
import '../../screens/profile.dart';
import '../forward_button.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _EditSettingScreenState();
}

class _EditSettingScreenState extends State<SettingScreen> {
  final isDarkMode = false.obs;
  final state = Get.find<AppController>();

  @override
  void initState() {
    // TODO: implement initState
    isDarkMode.value = GetStorage().read('isDarkMode') ?? false;
    print(isDarkMode.value);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: "Settings",
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              const Text(
                "Account",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20),
              InkWell(
                onTap: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context)=> const ProfileScreen()));
                },
                child: SizedBox(
                  width: double.infinity,
                  child: Row(
                    children: [
                      Image.asset("assets/images/avt.png", width: 70, height: 70),
                      const SizedBox(width: 20),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Công thức nấu ăn",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Kênh chia sẻ",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                      const Spacer(),
                      ForwardButton(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AccountScreen(),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40),
              const Text(
                "Settings",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20),
              SettingItem(
                title: "Language",
                icon: Ionicons.earth,
                bgColor: Colors.orange.shade100,
                iconColor: Colors.orange,
                value: "English",
                onTap: () {},
              ),
              const SizedBox(height: 20),
              SettingItem(
                title: "Notifications",
                icon: Ionicons.notifications,
                bgColor: Colors.blue.shade100,
                iconColor: Colors.blue,
                onTap: () {},
              ),
              const SizedBox(height: 20),
              Obx(() => 
              SettingSwitch(
                title: "Dark Mode",
                icon: Ionicons.earth,
                bgColor: Colors.purple.shade100,
                iconColor: Colors.purple,
                value: isDarkMode.value,
                onTap: (value) {
                    isDarkMode.value = value;
                    state.changeTheme(value);
                },
              )),
              const SizedBox(height: 20),
              SettingItem(
                title: "Help",
                icon: Ionicons.nuclear,
                bgColor: Colors.red.shade100,
                iconColor: Colors.red,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}