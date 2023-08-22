import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodapp/color.dart';
import 'package:foodapp/components/tabbar_item.dart';
import 'package:foodapp/pages/home/home_view.dart';
import 'package:foodapp/pages/root/root_controller.dart';
import 'package:get/get.dart';

class RootView extends GetView<RootController> {
  const RootView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        resizeToAvoidBottomInset: false,
        //
        body: _buildBody(),
        bottomNavigationBar: _buildFooter(),
        floatingActionButton: FloatingActionButton(
          backgroundColor: secodPrimary,
          child: Container(
              width: 25,
              height: 25,
              child: SvgPicture.asset(
                "assets/icons/cart.svg",
                color: primary,
              )),
          onPressed: () {},
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  Widget _buildBody() {
    return IndexedStack(
      index: controller.tabIndex.value, // current index your select
      children: [
        HomeView(),
        Container(),
      ], //your page for the tabs here
    );
  }

  Widget _buildFooter() {
    return AnimatedBottomNavigationBar.builder(
      backgroundGradient: gradientFullPrimary,
      onTap: (index) {
        controller.tabIndex.value = index;
      },
      itemCount: controller.tabs.length,
      backgroundColor: background,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.verySmoothEdge,
      tabBuilder: (int index, bool isActive) {
        return TabBarItem(
          isActive: isActive,
          icon: controller.tabs[index],
        );
      },
      activeIndex: controller.tabIndex.value,
    );
  }
}
