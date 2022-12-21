import 'package:flutter/material.dart';
import 'package:food/models/recipe_bundel.dart';
import 'package:food/screens/details/components/body.dart';
import 'package:food/screens/home/home_screen.dart';

class DetailsHome extends StatefulWidget {
  final RecipeBundle detailswidget;
  const DetailsHome({
    super.key,
    required this.detailswidget,
  });

  @override

  // ignore: no_logic_in_create_state
  DetailsHomeState createState() => DetailsHomeState(detailswidget);
}

class DetailsHomeState extends State<DetailsHome> {
  final RecipeBundle detailswidget;

  DetailsHomeState(this.detailswidget);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          },
        ),
        backgroundColor: widget.detailswidget.color,
        title: Text(detailswidget.title),
        centerTitle: true,
      ),
      body: Body(
        widget: widget.detailswidget,
      ),
    );
  }
}
