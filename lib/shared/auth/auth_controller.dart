import 'package:flutter/material.dart';
import 'package:payflow_flutterapp/modules/home/home_page.dart';
import 'package:payflow_flutterapp/modules/login/login_page.dart';
import 'package:payflow_flutterapp/shared/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  UserModel? _user;
  UserModel get user => _user!; //'garanto' que sera chamado só depois de logado

  void setUser(BuildContext context, UserModel? user) {
    if (user != null) {
      _user = user;

      Navigator.pushReplacementNamed(context, "/home");
    } else {
      Navigator.pushReplacementNamed(context, "/login");
    }
  }

  Future<void> saveUser(UserModel user) async {
    final instance = await SharedPreferences.getInstance();
    await instance.setString("user", user.toJson());
    return;
  }

  Future<void> currentUser(BuildContext context) async {
    final instance = await SharedPreferences.getInstance();
    if (instance.containsKey("user")) {
      final json = instance.get("user") as String;
      setUser(context, UserModel.fromJson(json));
    } else {
      setUser(context, null);
    }

    return;
  }
}
