import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme_this_app.dart';
import '../widgets/trainer_widgets/character_show_val_widget.dart';
import '../widgets/trainer_widgets/study_theme_widget.dart';
import '../widgets/trainer_widgets/show_random_val_widget.dart';

class TrainerPage extends StatefulWidget {
  const TrainerPage({Key? key}) : super(key: key);

  @override
  State<TrainerPage> createState() => _TrainerPageState();
}

class _TrainerPageState extends State<TrainerPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        const ShowRandomValWidget(),
        const CharacterShowValWidget(),
        const StudyTheme(),
        Container(
          alignment: Alignment.center,
          width: 102.w,
          height: 32.h,
          child: ElevatedButton(
            style: const ButtonStyle(
              backgroundColor:
                  MaterialStatePropertyAll<Color>(ThemeThisApp.fillButton),
            ),
            onPressed: () {},
            child: const Text(
              "Начать",
              style: ThemeThisApp.styleTextButton,
            ),
          ),
        ),
      ],
    );
  }
}
