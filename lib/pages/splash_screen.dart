import 'dart:async';

import 'package:academia_rost/theme_this_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../model/static_variable/static_variable.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    StaticVariable.userLoginEntity.getAllData();
    super.initState();
    Timer(
        const Duration(seconds: 2),
        () => Navigator.pushReplacementNamed(context,
            StaticVariable.userLoginEntity.register ? '/main_page' : '/auth'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeThisApp.fillButton,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Center(
            child: Image.asset(
                height: 180.h, width: 300.w, 'assets/splash_screen_image.png'),
          ),
          Center(
            child: Text(
              "АКАДЕМИЯ РОСТА",
              style: TextStyle(
                  fontSize: 36.sp,
                  fontWeight: FontWeight.w800,
                  color: ThemeThisApp.textInButtonColor),
            ),
          )
        ],
      ),
    );
  }
}
