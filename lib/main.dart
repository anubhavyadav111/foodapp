import 'package:flutter/material.dart';
import 'package:foodapp/color.dart';
import 'package:foodapp/routers/app_route_name.dart';
import 'package:foodapp/routers/app_route_page.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main() {
  runApp(const FoodApp());
}

class FoodApp extends StatelessWidget {
  const FoodApp({super.key});
 
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: AppRoutePage.routes,
      initialRoute: AppRouteName.root,

      // define default style
      theme: ThemeData(
        primaryColor: primary,
        scaffoldBackgroundColor: background, // background color
        appBarTheme: AppBarTheme(
            centerTitle: true,
            backgroundColor: white,
            titleTextStyle: TextStyle(
                color: black, fontSize: 20)), // app bar default style every
      ),
    );
  }
}
