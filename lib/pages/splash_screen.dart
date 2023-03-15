import 'dart:async';

import 'package:academi_rost/ThemeThisApp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  static bool register = false;
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 2),
        () => Navigator.pushReplacementNamed(
            context, SplashScreen.register ? '/main_page' : '/auth'));
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
                height: 200.h, width: 400.w, 'assets/splash_screen_image.png'),
          ),
          Center(
            child: Text(
              "АКАДЕМИЯ РОСТА",
              style: TextStyle(
                  fontSize: 40.sp,
                  fontWeight: FontWeight.w800,
                  color: ThemeThisApp.borderColor),
            ),
          )
        ],
      ),
    );
  }
}
