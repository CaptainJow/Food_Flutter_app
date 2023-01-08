import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:food/utils/api.endpoints.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class RegistrationController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> registerWithEmail() async {
    try {
      var headers = {"Content-Type": "application/json"};
      var url = Uri.parse(
          APiEndPoints.baseURL + APiEndPoints.authEndPoints.registerEmail);
      Map body = {
        "username": nameController.text,
        "password": passwordController.text,
        "email": emailController.text,
      };
      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        if (json["status"] == 400) {
          var resonseMS = json["errors"]["Email"];
          debugPrint(resonseMS);

          // ignore: unnecessary_nullable_for_final_variable_declarations
          final SharedPreferences? prefs = await _prefs;

          await prefs?.setString("value", resonseMS);
          nameController.clear();
          emailController.clear();
          passwordController.clear();
        } else {
          throw jsonDecode(response.body)["errors"]["Email"] ?? "Unknown Error";
        }
      } else {
        throw jsonDecode(response.body)["errors"]["Email"] ?? "Unknown Error";
      }
    } catch (e) {
      debugPrint("error here ");
    }
  }
}
