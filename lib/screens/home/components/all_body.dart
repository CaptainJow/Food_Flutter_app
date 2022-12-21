import 'package:flutter/material.dart';
import 'package:food/screens/home/components/recipe_bundle_card.dart';

import '../../../size_config.dart';
import '../../details/home_widget_details.dart';
import 'package:food/models/recipe_bundel.dart';

class AllBody extends StatelessWidget {
  const AllBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.defaultSize * 2,
        ),
        child: GridView.builder(
          itemCount: recipeBundles.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount:
                SizeConfig.orientation == Orientation.landscape ? 2 : 1,
            mainAxisSpacing: 20,
            crossAxisSpacing: SizeConfig.orientation == Orientation.landscape
                ? SizeConfig.defaultSize * 2
                : 0,
            childAspectRatio: 1.65,
          ),
          itemBuilder: (context, index) => RecipeBundelCard(
            smth: recipeBundles[index],
            press: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsHome(
                  detailswidget: recipeBundles[index],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
