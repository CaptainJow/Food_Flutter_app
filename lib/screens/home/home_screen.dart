import 'package:flutter/material.dart';
import 'package:food/models/recipe_bundel.dart';
import 'package:food/screens/home/components/body.dart';
import 'package:food/screens/home/components/drawer.dart';
import 'package:food/size_config.dart';

import '../recipe/recipe_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  // Add a property to hold the search term
  String searchTerm = '';

  Icon customIcon = const Icon(Icons.search);
  Widget customSearchBar = const Text('Recipe App');
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _textEditingController.addListener(_clearText);
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  void _clearText() {
    if (_textEditingController.text.isNotEmpty &&
        _textEditingController.text.endsWith('\n')) {
      setState(() {
        // Store the search term and clear the TextField
        searchTerm = _textEditingController.text.trim();
        _textEditingController.text = '';

        // Print the search term to the console
        debugPrint(searchTerm);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: customSearchBar,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: MySearchDelegate(),
              );
            },
          ),
        ],
        centerTitle: true,
      ),
      body: const Body(),
      drawer: const NavigationDrawer(),
    );
  }

  // Future writeItem({required String name}) async {
  //   final docSearchBar =
  //       FirebaseFirestore.instance.collection("Recipe").doc(name);
  //   final json = {
  //     "id": 14,
  //     "name": name,
  //     "time": 45,
  //     "imgSRC": "assets/images/egg-drop-noodle.jpg",
  //     "type": "Chinese"
  //   };

  //   await docSearchBar.set(json);
  // }
}

class MySearchDelegate extends SearchDelegate {
  List<String> searchResults = foods.map((food) => food.name).toList();
  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          close(context, null);
        },
      );

  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
            onPressed: () {
              if (query.isEmpty) {
                close(context, null);
              } else {
                query = '';
              }
            },
            icon: const Icon(Icons.clear)),
      ];

  @override
  Widget buildResults(BuildContext context) => Center(
        child: Text(
          query,
          style: const TextStyle(fontSize: 64),
        ),
      );

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query == "" || query.isEmpty) {
      return Container();
    }

    List<String> suggetions = searchResults.where((searchResult) {
      final result = searchResult.toLowerCase();
      final input = query.toLowerCase();

      return result.contains(input);
    }).toList();
    return ListView.builder(
      itemCount: suggetions.length,
      itemBuilder: (context, index) {
        final suggetion = suggetions[index];

        return ListTile(
          title: Text(suggetion),
          onTap: () {
            query = suggetion;

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RecipeScreen(
                    recipe:
                        foods.where((item) => item.name == suggetion).first),
              ),
            );
          },
        );
      },
    );
  }
}
