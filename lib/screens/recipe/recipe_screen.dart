import 'package:flutter/material.dart';
import 'package:food/models/recipe.dart';
import 'package:food/screens/recipe/components/body.dart';

class RecipeScreen extends StatelessWidget {
  final Recipe recipe;
  const RecipeScreen({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        elevation: 0,
      ),
      body: Body(recipe: recipe),
    );
  }
}
