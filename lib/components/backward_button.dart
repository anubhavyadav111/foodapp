import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';

class BackwardButton extends StatelessWidget {
  const BackwardButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Get.back();
        },
        borderRadius: BorderRadius.circular(100),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
          ),
          padding: EdgeInsets.all(19),
          width: 20,
          height: 20,
          child: SvgPicture.asset("assets/icons/arrow-backward.svg"),
        ),
      ),
    );
  }
}
