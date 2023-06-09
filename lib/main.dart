import 'package:academia_rost/model/entity/teacher_entity/group_entity.dart';
import 'package:academia_rost/model/entity/user_info.dart';
import 'package:academia_rost/pages/profile_pages/profil_info_widget.dart';
import 'package:academia_rost/pages/profile_pages/profile_screen.dart';
import 'package:academia_rost/pages/select_group_page/select_group_info_screen.dart';
import 'package:academia_rost/theme_this_app.dart';
import 'package:academia_rost/pages/auth_pages.dart';
import 'package:academia_rost/pages/splash_screen.dart';
import 'package:academia_rost/widgets/trainer_widgets/random_val_character_and_theme.dart';
import 'package:academia_rost/widgets/trainer_widgets/show_random_val_widget.dart';
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
            ),
            scrollbarTheme: ScrollbarThemeData(
              thumbColor: MaterialStatePropertyAll<Color>(
                  ThemeThisApp.borderColor), // цвет ползунка
              trackColor: MaterialStatePropertyAll<Color>(ThemeThisApp
                  .fillButton
                  .withAlpha(80)), // цвет фона полосы прокрутки
            ),
          ),
          routes: {
            '/splash_screen': (context) => const SplashScreen(),
            '/auth': (context) => const FormRegister(),
            '/main_page': (context) => const MainPage(),
            '/user_profile_info': (context) {
              return ProfileScreen();
            },
            '/teacher/search_student': (context) {
              UserInfo user =
                  ModalRoute.of(context)?.settings.arguments as UserInfo;
              return ProfileScreen.selectStudent(false, user);
            },
            '/trainer/showNumber': (context) {
              RandomValCharacterAndTheme val = ModalRoute.of(context)
                  ?.settings
                  .arguments as RandomValCharacterAndTheme;
              return ShowRandomValWidget(val);
            },
            '/teacher/groups/selectGroup': (context) {
              GroupEntity? group =
                  ModalRoute.of(context)?.settings.arguments as GroupEntity?;
              return SelectGroupInfoScreen(group);
            }
          },
          initialRoute: '/splash_screen',
        );
      },
    );
  }
}
