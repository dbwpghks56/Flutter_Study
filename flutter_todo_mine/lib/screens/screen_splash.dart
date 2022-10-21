import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_todo_mine/controller/controller_user.dart';
import 'package:flutter_todo_mine/screens/screen_login.dart';
import 'package:flutter_todo_mine/screens/screen_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class ScreenSplash extends StatefulWidget {
  @override
  _ScreenSplashState createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  final userController = Get.put(UserController());

  Future<bool> checkLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLogin = prefs.getBool("isLogin") ?? false;

    if(isLogin) {
      await userController.Login(prefs.getString("id")!, prefs.getString("password")!);
    }

    return isLogin;
  }

  void moveScreen() async {
    await checkLogin().then((value) {
      if(value) {
        Get.off(() => ScreenMain());
      }
      else {
        Get.off(() => ScreenLogin());
      }
    });
  }

  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 1500), () {
      moveScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: null,
      body: Center(
        child: Text("Splash Screen"),
      ),
    );
  }
}