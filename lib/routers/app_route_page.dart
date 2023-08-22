//define all the page here

import 'package:foodapp/pages/home/home_binding.dart';
import 'package:foodapp/pages/home/home_view.dart';
import 'package:foodapp/pages/root/root_binding.dart';
import 'package:foodapp/pages/root/root_view.dart';
import 'package:foodapp/routers/app_route_name.dart';
import 'package:get/get.dart';

class AppRoutePage {
  static final routes = [
    GetPage(
      name: AppRouteName.home,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRouteName.root,
      page: () => RootView(),
      binding: RootBinding(),
    ),
  ];
}
