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
  RandomValCharacterAndTheme characterAndTheme = RandomValCharacterAndTheme();
  CharacterShowValWidget characterShowValWidget = CharacterShowValWidget();
  StudyTheme studyTheme = StudyTheme();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        SizedBox(
          width: 120.w,
          height: 80.h,
          child: const Center(
            child: Text(
              "Тренажер",
              style: TextStyle(color: ThemeThisApp.fillButton, fontSize: 40),
            ),
          ),
        ),
        characterShowValWidget,
        studyTheme,
        Container(
          alignment: Alignment.center,
          width: 102.w,
          height: 40.h,
          child: ElevatedButton(
            style: const ButtonStyle(
              backgroundColor:
                  MaterialStatePropertyAll<Color>(ThemeThisApp.fillButton),
            ),
            onPressed: () {
              List<dynamic> characterTr =
                  characterShowValWidget.characterTrainer.values.toList();
              characterAndTheme.timer = characterTr[0];
              characterAndTheme.digit = characterTr[1].round();
              characterAndTheme.count = characterTr[2].round();
              characterAndTheme.themeName = studyTheme.selectThemeName;
              characterAndTheme.getRandomArray();
              setState(() {
                Navigator.pushNamed(context, "/trainer/showNumber",
                    arguments: characterAndTheme);
                // print("231123${showRandomValWidget.output}");
              });
            },
            child: const Text(
              "Начать",
              style: ThemeThisApp.styleTextButton,
            ),
          ),
        ),
      ],
    );
  }
  //
  // ShowRandomValWidget getShowRandomValWidget() {
  //   return characterAndTheme.isStart
  //       ? ShowRandomValWidget.withNumbers(
  //           characterAndTheme.output, characterAndTheme.timer)
  //       : ShowRandomValWidget();
  // }
}
