import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quote_app/controller/themes.dart';
import 'package:quote_app/view/homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      init: ThemeController()..gettheme(),
      builder: (controller) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(
            useMaterial3: true,
          ),
          
          darkTheme: ThemeData.dark(useMaterial3: true),
          themeMode: controller.themeMode,
          home: HomeScreen(),
        );
      },
    );
  }
}
