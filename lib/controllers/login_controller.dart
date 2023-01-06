import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> login() async {
    try {
      var headers = {"Content-Type": "application/json"};
      var url = Uri.parse("https://192.168.1.107:7232/api/Users/login");
      Map body = {
        "email": emailController.text,
        "password": passwordController.text,
      };
      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        debugPrint("it works");
        // Save the token in shared preferences
        // Navigate to the home screen
      } else {
        // Show an error message to the user
      }
    } catch (e) {
      // Show an error message to the user
    }
  }
}
