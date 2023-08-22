import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController{
  bool isdark = false;

  ThemeMode get themeMode{
   if (isdark == true) {
     return ThemeMode.dark;
   }else{
   return ThemeMode.light;
   }
  }

  changetheme(bool theme)async{
    
     isdark = theme;
     update();
     SharedPreferences pref = await SharedPreferences.getInstance();
    theme?pref.setString('theme', 'dark'):pref.setString('theme', 'light');  
     update();
  }

  gettheme()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    final String? theme =  pref.getString('theme');
    if (theme == 'dark') {
      isdark = true;
      update();
    }else{
      isdark = false;
      update(); 
    }
  }
}