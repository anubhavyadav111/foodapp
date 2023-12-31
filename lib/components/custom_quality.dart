
import 'package:flutter/material.dart';
import 'package:foodapp/color.dart';

class CustomQuality extends StatelessWidget {
  const CustomQuality({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 80,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40), gradient: gradientPrimary),
      child: Row(children: [
        Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
          ),
          child: Center(
              child: Text(
            "-",
            style: TextStyle(color: white, fontWeight: FontWeight.bold),
          )),
        ),
        Expanded(
            child: Text(
          "1",
          style: TextStyle(color: secodPrimary, fontWeight: FontWeight.bold),
        )),
        Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
          ),
          child: Center(
              child: Text(
            "+",
            style: TextStyle(color: white, fontWeight: FontWeight.bold),
          )),
        )
      ]),
    );
  }
}
