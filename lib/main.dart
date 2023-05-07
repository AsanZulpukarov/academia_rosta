import 'package:academia_rost/theme_this_app.dart';
import 'package:academia_rost/model/entity/user_info.dart';
import 'package:academia_rost/pages/auth_pages.dart';
import 'package:academia_rost/pages/splash_screen.dart';
import 'package:academia_rost/pages/profil_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'pages/button_navigation_bar.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const SignIn());
}

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
                  const AppBarTheme(backgroundColor: ThemeThisApp.fillButton),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                backgroundColor: ThemeThisApp.fillButton,
                selectedItemColor: ThemeThisApp.borderColor,
                unselectedItemColor: ThemeThisApp.textInButtonColor,
              )),
          routes: {
            '/splash_screen': (context) => const SplashScreen(),
            '/auth': (context) => const FormRegister(),
            '/main_page': (context) => const MainPage(),
            '/user_profile_info': (context) {
              UserInfo user =
                  ModalRoute.of(context)?.settings.arguments as UserInfo;
              return ProfileInfoWidget(user: user);
            },
            '/teacher/search_student': (context) {
              return ProfileInfoWidget(user: UserInfo());
            }
          },
          initialRoute: '/splash_screen',
        );
      },
    );
  }
}
