import 'package:flutter/material.dart';

import 'package:food/screens/home/components/all_body.dart';
import 'package:food/screens/home/components/category_body.dart';

import 'categories.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Categories(),
        // Listen to changes in the ValueNotifier and use the value to determine
        // which widget to show
        ValueListenableBuilder<String>(
          valueListenable: Categories.selectedCategoryNotifier,
          builder: (context, selectedCategory, _) {
            if (selectedCategory == 'All') {
              return const AllBody();
            } else if (selectedCategory == 'Indian') {
              return const CategoryBody(category: 'Indian');
            } else if (selectedCategory == 'Italian') {
              return const CategoryBody(category: 'Italian');
            } else if (selectedCategory == 'US') {
              return const CategoryBody(category: "US");
            } else if (selectedCategory == 'Chinese') {
              return const CategoryBody(category: 'Chinese');
            } else {
              return const AllBody();
            }
          },
        ),
      ],
    );
  }
}
