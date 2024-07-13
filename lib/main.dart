import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:thflutter/app_state.dart';
import 'package:thflutter/firebase_options.dart';
import 'package:thflutter/screens/onboarding_screen.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('shopping');
  await Hive.openBox('saved');
  await GetStorage.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  Get.put(AppController());
  runApp(
    const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "BTL",
      themeMode: ThemeMode.light,
      localizationsDelegates:  [
        DefaultMaterialLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
      ],
      supportedLocales:  [
        Locale('en', 'US'),
        Locale('vi', 'VN'),
      ],
      home: OnBoardingScreen(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnBoardingScreen(),
    );
  }
}
