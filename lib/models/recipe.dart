import 'package:cloud_firestore/cloud_firestore.dart';

class Recipe {
  late final int id;
  late final String name;
  late final int time;
  late final String imgSRC;
  late final String type;
  late final String description;
  Recipe({
    required this.id,
    required this.name,
    required this.time,
    required this.imgSRC,
    required this.type,
    required this.description,
  });
  factory Recipe.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Recipe(
      id: data?['id'],
      name: data?['name'],
      time: data?['time'],
      imgSRC: data?['imgSRC'],
      type: data?['type'],
      description: data?['description'],
    );
  }
  Map<String, dynamic> toFirestore() {
    return {
      "id": id,
      "name": name,
      "time": time,
      "imgSRC": imgSRC,
      "type": type,
      "description": description,
    };
  }

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'],
      name: json['name'],
      time: json['time'],
      imgSRC: json['imgSRC'],
      type: json['type'],
      description: json['description'],
    );
  }
}
