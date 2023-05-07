import 'package:academia_rost/widgets/trainer_widgets/random_val_character_and_theme.dart';
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
  bool isStart = false;

  RandomValCharacterAndTheme characterAndTheme = RandomValCharacterAndTheme();
  ShowRandomValWidget showRandomValWidget = ShowRandomValWidget();
  CharacterShowValWidget characterShowValWidget = CharacterShowValWidget();
  StudyTheme studyTheme = StudyTheme();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        showRandomValWidget,
        characterShowValWidget,
        studyTheme,
        Container(
          alignment: Alignment.center,
          width: 102.w,
          height: 32.h,
          child: ElevatedButton(
            style: const ButtonStyle(
              backgroundColor:
                  MaterialStatePropertyAll<Color>(ThemeThisApp.fillButton),
            ),
            onPressed: () {
              List<dynamic> characterTr =
                  characterShowValWidget.characterTrainer.values.toList();
              characterAndTheme.timer = characterTr[0];
              characterAndTheme.digit = characterTr[1];
              characterAndTheme.count = characterTr[2];
              characterAndTheme.theme = studyTheme.selectThemeName;
            },
            child: Text(
              isStart ? "Начать" : "Проверить",
              style: ThemeThisApp.styleTextButton,
            ),
          ),
        ),
      ],
    );
  }
}
