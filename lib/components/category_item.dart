import 'package:flutter/material.dart';
import 'package:foodapp/color.dart';
import 'package:foodapp/constant.dart';

class CategoryItem extends StatelessWidget {
  final String image;
  final String title;
  final bool isActive;
  final Function()? onTap;

  const CategoryItem(
      {super.key, this.image = "", this.title = "", this.isActive = false, this.onTap});

  @override
  Widget build(BuildContext context) {
    if (isActive) {
      return Padding(
        padding: EdgeInsets.only(left: gap),
        child: InkWell(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
                color: primary,
                border: Border.all(color: primary.withOpacity(.8), width: 2),
                borderRadius: BorderRadius.circular(50)),
            width: 140,
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      color: white, borderRadius: BorderRadius.circular(100)),
                  child: Image.asset("assets/images/" + image),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Text(
                      title,
                      style: TextStyle(
                          color: white,
                          fontSize: 13,
                          fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
    return Padding(
      padding: EdgeInsets.only(left: gap),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: primary.withOpacity(.8), width: 2),
              borderRadius: BorderRadius.circular(50)),
          width: 140,
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(5),
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    color: white, borderRadius: BorderRadius.circular(100)),
                child: Image.asset("assets/images/" + image),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
