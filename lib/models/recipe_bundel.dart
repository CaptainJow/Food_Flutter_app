import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food/models/recipe.dart';

class RecipeBundle {
  final int id, chefs, recipes;
  final String title, description, imageSrc;
  final Color color;
  List<Recipe> food;
  RecipeBundle(
      {required this.id,
      required this.chefs,
      required this.recipes,
      required this.title,
      required this.description,
      required this.imageSrc,
      required this.color,
      required this.food});
}

// Demo list

List<Recipe> foods = [];

void add() async {
  foods.addAll(await getData());
}

List<RecipeBundle> recipeBundles = [
  RecipeBundle(
    id: 1,
    chefs: 16,
    recipes: 95,
    title: "All the Recipes",
    description: "New and tasty recipes every minute",
    imageSrc: "assets/images/cook_new@2x.png",
    color: const Color(0xFFD82D40),
    food: foods,
  ),
  RecipeBundle(
    id: 2,
    chefs: 8,
    recipes: 26,
    title: "For Recipes under 35 minutes",
    description: "Recommended recipies by our chefs",
    imageSrc: "assets/images/best_2020@2x.png",
    color: const Color(0xFF90AF17),
    food: foods,
  ),
  RecipeBundle(
    id: 3,
    chefs: 10,
    recipes: 43,
    title: "Recommended",
    description: "What's your favorite food dish make it now",
    imageSrc: "assets/images/food_court@2x.png",
    color: const Color(0xFF2DBBD8),
    food: foods,
  ),
];

Future<Recipe?> getRecipe(String id) {
  return FirebaseFirestore.instance
      .collection("Recipe")
      .doc(id)
      .withConverter(
        fromFirestore: Recipe.fromFirestore,
        toFirestore: (Recipe city, _) => city.toFirestore(),
      )
      .get()
      .then((docSnap) => docSnap.data());
}

void printRecipe(String id) async {
  Recipe? recipe = await getRecipe(id);
  if (recipe != null) {
    debugPrint(recipe.name);
  } else {
    debugPrint("No such recipe.");
  }
}

final _fireStore = FirebaseFirestore.instance;
Future<List<Recipe>> getData() async {
  // Get docs from collection reference
  QuerySnapshot querySnapshot = await _fireStore.collection('Recipe').get();

  // Get data from docs and convert map to List
  final allData = querySnapshot.docs.map((doc) => doc.data()).toList();

  final recipes = allData
      .map((json) => Recipe.fromJson(json as Map<String, dynamic>))
      .toList();

  return recipes;
}
