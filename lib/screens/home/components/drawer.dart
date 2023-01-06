import 'package:flutter/material.dart';
import 'package:food/screens/home/components/login.dart';

import '../../../models/recipe_bundel.dart';
import '../../details/home_widget_details.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) => Drawer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildHeader(context),
              buildMenuItems(context),
            ],
          ),
        ),
      );
}

Widget buildHeader(BuildContext context) => Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
      ),
      child: Column(children: const [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            radius: 52,
          ),
        )
      ]),
    );
Widget buildMenuItems(BuildContext context) => Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Wrap(
            runSpacing: 5,
            children: [
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Home'),
                onTap: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => DetailsHome(
                      detailswidget: recipeBundles[0],
                    ),
                  ),
                ),
              ),
              const Divider(color: Colors.black54),
              ListTile(
                leading: const Icon(Icons.food_bank),
                title: const Text('Fast Recipies'),
                onTap: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => DetailsHome(
                      detailswidget: recipeBundles[1],
                    ),
                  ),
                ),
              ),
              const Divider(color: Colors.black54),
              ListTile(
                leading: const Icon(Icons.recommend),
                title: const Text('Recommended'),
                onTap: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => DetailsHome(
                      detailswidget: recipeBundles[2],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 300, left: 50),
            child: ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Login'),
              onTap: () {
                //Push the login page onto the navigation stack
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
