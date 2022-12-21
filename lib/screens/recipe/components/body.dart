import 'package:flutter/material.dart';

import '../../../models/recipe.dart';

class Body extends StatelessWidget {
  final Recipe recipe;
  const Body({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            child: Stack(
              children: [
                Image.asset(
                  recipe.imgSRC,
                  fit: BoxFit.cover,
                ),
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.3),
                  constraints: const BoxConstraints(minHeight: 500),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                recipe.name,
                                textAlign: TextAlign.center,
                                softWrap: true,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4
                                    ?.copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 30, right: 40, top: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      height: 50,
                                      child: FittedBox(
                                        child: Text(
                                          "${recipe.time}M",
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1
                                              ?.copyWith(
                                                color: Colors.redAccent[700],
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                        width:
                                            9), // add some spacing between the container and the icon
                                    const Icon(
                                      Icons.watch_later_outlined,
                                      color: Colors.black,
                                      size: 45,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 50,
                                  child: Image.asset(
                                    _getFlagAsset(recipe.type),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 30, right: 40, top: 20, bottom: 20),
                            child: Text(
                              recipe.description,
                              style: const TextStyle(
                                height: 1.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

String _getFlagAsset(String type) {
  switch (type) {
    case 'Italian':
      return 'assets/images/italy_flag.png';
    case 'US':
      return 'assets/images/us_flag.png';
    case 'Chinese':
      return 'assets/images/china_flag.png';
    case 'Indian':
      return 'assets/images/india_flag.png';
    default:
      return 'assets/images/placeholder_flag.png';
  }
}
