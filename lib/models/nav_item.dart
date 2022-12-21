import 'package:flutter/widgets.dart';

class NavItem {
  final int? id;
  final String? icon;
  final Widget? destination;

  NavItem({required this.id, required this.icon, required this.destination});

// If there is no destination then it help us
  bool destinationChecker() {
    if (destination != null) {
      return true;
    }
    return false;
  }
}

//,