import 'package:flutter/material.dart';
import 'package:foodapp/components/category_item.dart';
import 'package:foodapp/data/category_data.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class CategoryTab extends StatefulWidget {
  const CategoryTab({super.key});

  @override
  State<CategoryTab> createState() => _CategoryTabState();
}

class _CategoryTabState extends State<CategoryTab> {
  AutoScrollController? _autoScrollController;
  @override
  Widget build(BuildContext context) {
    // Calculate the number of items to generate, ensuring it doesn't exceed the length of categories.
    int itemCount = categories.length > 10 ? 10 : categories.length;

    return SingleChildScrollView(
      controller: _autoScrollController,
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(itemCount, (index) {
          return AutoScrollTag(
            key: ValueKey(index),
            index: index,
            controller: _autoScrollController!,
            child: CategoryItem(
              onTap: () {
                onSelectCategory(index);
              },
              isActive: categories[index]["isActive"],
              image: categories[index]["image"],
              title: categories[index]["title"],
            ),
          );
        }),
      ),
    );
  }

  onSelectCategory(index) {
    categories.forEach((item) {
      item["isActive"] = false;
    });

    setState(() {
      categories[index]["isActive"] = !categories[index]["isActive"];
    });
    _autoScrollController!
        .scrollToIndex(index, preferPosition: AutoScrollPosition.middle);
  }

  init() {
    _autoScrollController = AutoScrollController(axis: Axis.horizontal);
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  void dispose() {
    _autoScrollController!.dispose();
    super.dispose();
  }
}
