import 'package:academi_rost/ThemeThisApp.dart';
import 'package:academi_rost/model/entity/student_user_entity.dart';
import 'package:academi_rost/pages/auth_pages.dart';
import 'package:academi_rost/pages/splash_screen.dart';
import 'package:academi_rost/pages/student_pages/user_profil_screen.dart';
import 'package:academi_rost/pages/teacher_pages/teacher_profil_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'pages/ButtonNavigationBar.dart';

void main() => runApp(SignIn());

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 640),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              appBarTheme:
                  AppBarTheme(backgroundColor: ThemeThisApp.fillButton),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                backgroundColor: ThemeThisApp.fillButton,
                selectedItemColor: ThemeThisApp.borderColor,
                unselectedItemColor: ThemeThisApp.textInButtonColor,
              )),
          routes: {
            '/splash_screen': (context) => SplashScreen(),
            '/auth': (context) => FormRegister(),
            '/main_page': (context) => MainPage(),
            '/user_profile': (context) => StudentProfileScreen(),
            '/teacher_profile': (context) => TeacherProfileScreen(),
          },
          initialRoute: '/splash_screen',
        );
      },
    );
  }
}
