import 'package:flutter/material.dart';
import 'package:thflutter/components/drawer/my_drawer_title.dart';
import 'package:thflutter/components/setting/setting_screen.dart';
import 'package:thflutter/screens/home.dart';
import 'package:thflutter/screens/profile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          // app logo
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Icon(
              Icons.lock_open_rounded,
              size: 40,
              color: Colors.deepPurple,
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Divider(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),

          // home list title
          MyDrawerTitle(
              text: "H O M E",
              icon: Icons.home,
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                );
              }
          ),

          // setting list title
          MyDrawerTitle(
              text: "S E T T I N G",
              icon: Icons.settings,
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SettingScreen())
                );
              }
          ),
          MyDrawerTitle(
              text: "A C C O U N T",
              icon: Icons.account_circle_rounded,
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AccountScreen())
                );
              }
          ),

          const Spacer(),


          // logo out list title
          MyDrawerTitle(
              text: "L O G O U T",
              icon: Icons.logout,
              onTap: (){}
          ),






        ],

      ),
    );
  }
}
