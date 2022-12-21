import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../models/recipe.dart';
import '../../../models/recipe_bundel.dart';
import '../../../size_config.dart';
import '../../recipe/recipe_screen.dart';

class Body extends StatelessWidget {
  final RecipeBundle widget;

  const Body({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    List<Recipe> recipelist = [];
    if (widget.id == 2) {
      recipelist = widget.food.where((i) => i.time < 35).toList();
    } else if (widget.id == 1) {
      recipelist = List.from(widget.food);
    } else if (widget.id == 3) {
      recipelist =
          widget.food.where((i) => i.description.length < 1000).toList();
    }
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: GridView.builder(
              itemCount: recipelist.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 0.60,
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 30,
              ),
              itemBuilder: (context, index) => FoodCard(
                widget: widget,
                food: recipelist[index],
                press: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        RecipeScreen(recipe: recipelist[index]),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
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
  final RecipeBundle widget;
  final Recipe food;
  final VoidCallback press;
  const FoodCard(
      {super.key,
      required this.widget,
      required this.food,
      required this.press});

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
                  color: widget.color, borderRadius: BorderRadius.circular(16)),
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
