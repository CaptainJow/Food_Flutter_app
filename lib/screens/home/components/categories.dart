import "package:flutter/material.dart";
import '../../../constants.dart';
import '../../../size_config.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();

  // Create a ValueNotifier that will hold the selected category
  static final selectedCategoryNotifier = ValueNotifier<String>('All');
}

class _CategoriesState extends State<Categories> {
  List<String> categories = ["All", "Indian", "Italian", "US", "Chinese"];

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: SizeConfig.defaultSize * 0.5),
      child: SizedBox(
        height: SizeConfig.defaultSize * 3.5,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: ((context, index) => buildCategoriItem(index))),
      ),
    );
  }

  Widget buildCategoriItem(int index) => GestureDetector(
        onTap: () {
          setState(
            () {
              selectedIndex = index;
              Categories.selectedCategoryNotifier.value = categories[index];
            },
          );
        },
        child: Stack(
          children: [
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: SizeConfig.defaultSize * 2),
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.defaultSize * 2,
                vertical: SizeConfig.defaultSize * 0.5,
              ),
              decoration: BoxDecoration(
                color: selectedIndex == index
                    ? const Color.fromARGB(15, 243, 77, 0)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(
                  SizeConfig.defaultSize * 1.6,
                ),
              ),
              child: Text(
                categories[index],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: selectedIndex == index
                      ? kPrimaryColor
                      : const Color(0xFFC2C285),
                ),
              ),
            ),
          ],
        ),
      );
}
