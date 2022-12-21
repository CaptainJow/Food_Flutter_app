import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food/models/recipe_bundel.dart';
import 'package:food/screens/recipe/recipe_screen.dart';

import '../../../models/recipe.dart';
import '../../../size_config.dart';

class CategoryBody extends StatelessWidget {
  final String category;

  const CategoryBody({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    List<Recipe> finalRec = foods.where((i) => i.type == category).toList();
    return Expanded(
      flex: 1,
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: GridView.builder(
                itemCount: finalRec.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.60,
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 30,
                ),
                itemBuilder: (context, index) => FoodCard(
                  food: finalRec[index],
                  press: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          RecipeScreen(recipe: finalRec[index]),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

Row buildInfoRow(double defaultSize, {required String iconSrc, text}) {
  return Row(
    children: [
      SvgPicture.asset(iconSrc),
      SizedBox(
        width: defaultSize,
      ),
      Text(
        text,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    ],
  );
}

class FoodCard extends StatelessWidget {
  final Recipe food;
  final VoidCallback press;
  const FoodCard({super.key, required this.food, required this.press});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(SizeConfig.defaultSize * 2),
              decoration: BoxDecoration(
                  color: Colors.amber, borderRadius: BorderRadius.circular(16)),
              child: Column(
                children: [
                  const Spacer(),
                  Image.asset(
                    food.imgSRC,
                    fit: BoxFit.cover,
                    height: 160,
                  ),
                  const Spacer(),
                  buildInfoRow(SizeConfig.defaultSize,
                      iconSrc: "assets/icons/clocks2.svg",
                      text: "${food.time} min"),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 40,
            child: Text(
              food.name,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
