import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodapp/color.dart';
import 'package:foodapp/components/category_tab.dart';
import 'package:foodapp/components/product_item.dart';
import 'package:foodapp/constant.dart';
import 'package:foodapp/data/product_data.dart';
import 'package:foodapp/pages/home/home_controller.dart';
import 'package:foodapp/routers/app_route_name.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _getHeader(),
          _getSearch(),
          _getCategories(),
          _getPopular(),
        ],
      ),
    );
  }

  Widget _getHeader() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(left: gap, right: gap, top: gap),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hey Anubhav ",
                  style: TextStyle(fontSize: gap, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Let's find quanlity food",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: primary.withOpacity(0.5)),
                )
              ],
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(gap),
              child: Container(
                  width: 60,
                  height: 60,
                  child: Image.asset("assets/images/profile.jpg")),
            )
          ],
        ),
      ),
    );
  }

  _getSearch() {
    return Container(
      padding: EdgeInsets.only(left: gap, right: gap, top: gap),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      blurRadius: 6,
                      spreadRadius: 6,
                      offset: Offset(0, 3),
                      color: black.withOpacity(.03))
                ]),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Search food...",
                    hintStyle: TextStyle(
                      color: primary.withOpacity(0.5),
                    ),
                    filled: true,
                    fillColor: white,
                    prefixIcon: Container(
                      padding: EdgeInsets.all(10),
                      width: 28,
                      height: 28,
                      child: SvgPicture.asset("assets/icons/search.svg"),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(gap),
                        borderSide: BorderSide.none),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(gap),
                        borderSide: BorderSide.none),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(gap),
                  color: secodPrimary),
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Container(
                width: 28,
                height: 28,
                child: SvgPicture.asset("assets/icons/filter.svg"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getCategories() {
    return Container(
      padding: EdgeInsets.only(top: gap),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: gap, right: gap),
            child: Text(
              "Categories",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          SizedBox(
            height: gap,
          ),
          CategoryTab(),
        ],
      ),
    );
  }

  Widget _getPopular() {
    return Container(
      padding: EdgeInsets.only(top: gap),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: gap, right: gap),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Popular",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Text(
                  'See all',
                  style: TextStyle(
                      color: black.withOpacity(.5),
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          SizedBox(
            height: gap,
          ),
          Container(
            padding: EdgeInsets.only(left: gap, right: gap),
            child: Column(
              children: List.generate(PRODUCTS.length, (index) {
                var product = PRODUCTS[index];
                return GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRouteName.detail,
                        arguments: {"data": product});
                  },
                  child: ProductItem(
                    tag: product["id"],
                    title: product["title"],
                    descripton: product["description"],
                    calory: product["calories"],
                    price: product["price"],
                    image: product["image"],
                  ),
                );
              }),
            ),
          ),

          // Column(
          //   children: List.generate(PRODUCTS.length, (index) {
          //     var product = PRODUCTS[index];
          //     return ProductItem(
          //       title: product["title"],
          //       descripiton: product["desciption"],
          //       calory: product["calories"],
          //       price: product["price"],
          //       image: product["image"],
          //     );
          //   }),
          // ),
        ],
      ),
    );
  }
  // Widget _getPopular() {
  //   return Container(
  //     padding: EdgeInsets.only(top: gap),
  //     child: Column(
  //       children: [
  //         Container(
  //           padding: EdgeInsets.only(left: gap, right: gap),
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [
  //               Text(
  //                 "Popular",
  //                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
  //               ),
  //               Text(
  //                 "See all",
  //                 style: TextStyle(
  //                     color: black.withOpacity(0.5),
  //                     fontWeight: FontWeight.w600),
  //               )
  //             ],
  //           ),
  //         ),
  //         SizedBox(
  //           height: gap,
  //         ),
  //         Container(
  //           padding: EdgeInsets.only(left: gap, right: gap),
  //           child: Column(
  //             children: List.generate(PRODUCTS.length, (index) {
  //               var product = PRODUCTS[index];
  //               return GestureDetector(
  //                 onTap: () {

  //                 },
  //                 child: ProductItem(
  //                   tag: product["id"],
  //                   title: product["title"],
  //                   descripiton: product["description"],
  //                   calory: product["calories"],
  //                   price: product["price"],
  //                   image: product["image"],
  //                 ),
  //               );
  //             }),
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }
}
