import 'dart:async';

import 'package:academia_rost/theme_this_app.dart';
import 'package:academia_rost/widgets/trainer_widgets/random_val_character_and_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../service/trainer_service.dart';

class ShowRandomValWidget extends StatefulWidget {
  bool isStart = false;
  TrainerService trainerService = TrainerService();
  RandomValCharacterAndTheme characterAndTheme = RandomValCharacterAndTheme();
  List<int> output = [0];

  ShowRandomValWidget({super.key});

  getRandomArray(RandomValCharacterAndTheme RVCAT) {
    characterAndTheme = RVCAT;
    output = trainerService.getArray(characterAndTheme.themeName,
        characterAndTheme.digit, characterAndTheme.count);
    isStart = true;
    print(output);
    createState();
  }

  @override
  State<ShowRandomValWidget> createState() {
    return _ShowRandomValWidgetState();
  }
}

class _ShowRandomValWidgetState extends State<ShowRandomValWidget> {
  final TextEditingController _answerController = TextEditingController();
  String answer = "";

  int currentIndex = 0;
  late Timer timer;

  bool writeAnswer = false;
  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(
        Duration(milliseconds: (widget.characterAndTheme.timer * 1000).round()),
        (timer) {
      setState(() {
        if (currentIndex < widget.output.length - 2) {
          currentIndex++;
        } else {
          writeAnswer = true;
          timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _answerController.dispose();
    super.dispose();

    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 112.w,
      height: 133.h,
      child: Column(
        children: [
          Container(
            width: 120.w,
            height: 90.h,
            alignment: Alignment.center,
            child: Text(
              writeAnswer
                  ? "Напиши ответ: "
                  : widget.output[currentIndex].toString(),
              style: ThemeThisApp.styleTextHeader,
            ),
          ),
          SizedBox(
            width: 220.w,
            height: 42.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 100.w,
                  height: 40.h,
                  child: TextField(
                    controller: _answerController,
                    enabled: widget.isStart,
                    style: ThemeThisApp.styleTextBase,
                    decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelText: 'Ответ',
                        labelStyle: ThemeThisApp.styleTextBase,
                        enabledBorder: ThemeThisApp.borderTextField,
                        focusedBorder: ThemeThisApp.borderTextField),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                  ),
                ),
                SizedBox(
                  width: 100.w,
                  height: 40.h,
                  child: ElevatedButton(
                    onPressed: () {
                      _showMessage(
                          checkAnswer() ? "Правильно!" : "Неправильно!",
                          widget.output!.last.toString());
                      setState(() {});
                    },
                    style: ThemeThisApp.styleButton,
                    child: const Text(
                      "Проверить",
                      style: ThemeThisApp.styleTextButton,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  bool checkAnswer() {
    answer = _answerController.text;
    return answer.compareTo(widget.output.last.toString()) == 0 ? true : false;
  }

  void _showMessage(String message, String trueAnswer) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: message.toLowerCase() == 'Правильно!'.toLowerCase()
            ? Colors.green
            : Colors.red,
        content: Center(
          child: Text(
            "$message\nОтвет: $trueAnswer",
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 18.0,
            ),
          ),
        ),
      ),
    );
  }
}
