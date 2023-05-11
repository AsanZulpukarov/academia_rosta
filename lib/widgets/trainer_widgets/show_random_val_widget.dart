import 'dart:async';

import 'package:academia_rost/widgets/trainer_widgets/random_val_character_and_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme_this_app.dart';

class ShowRandomValWidget extends StatefulWidget {
  RandomValCharacterAndTheme characterAndTheme;

  ShowRandomValWidget(this.characterAndTheme, {Key? key}) : super(key: key);

  @override
  State<ShowRandomValWidget> createState() => _ShowRandomValWidgetState();
}

class _ShowRandomValWidgetState extends State<ShowRandomValWidget> {
  late List<int> output;
  int currentIndex = 0;
  late Timer timer;
  bool isPressStart = true;
  bool isPressCheck = true;
  bool isShowNumber = true;

  @override
  void initState() {
    super.initState();
    output = widget.characterAndTheme.output;
    startTimer();
  }

  startTimer() {
    timer = Timer.periodic(
        Duration(milliseconds: (widget.characterAndTheme.timer * 1000).round()),
        (timer) {
      setState(() {
        if (currentIndex < output.length - 2) {
          currentIndex++;
        } else {
          isShowNumber = false;
          isPressCheck = false;
          timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: 175,
          padding: EdgeInsets.all(10.0.sp),
          child: Image.asset(
            'assets/logo/logo_WB.png',
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                  width: 300.w,
                  height: 300.h,
                  child: Center(
                    child: Text(
                      textAlign: TextAlign.center,
                      isShowNumber
                          ? currentIndex % 2 == 0
                              ? output.elementAt(currentIndex).toString()
                              : " ${output.elementAt(currentIndex)}"
                          : isPressStart
                              ? "Нажми проверить"
                              : "Ответ ${output.last}.",
                      style: TextStyle(
                          color: ThemeThisApp.styleTextBase.color,
                          fontSize: 50),
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: 120.w,
                  height: 40.h,
                  child: Center(
                    child: ElevatedButton(
                      style: isPressCheck
                          ? ThemeThisApp.styleDisableButton
                          : ThemeThisApp.styleButton,
                      onPressed: isPressCheck
                          ? null
                          : () {
                              isPressCheck = true;
                              isPressStart = false;
                              setState(() {});
                            },
                      child: const Text(
                        "Проверить",
                        style: ThemeThisApp.styleTextButton,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: 120.w,
                  height: 40.h,
                  child: Center(
                    child: ElevatedButton(
                      style: isPressStart
                          ? ThemeThisApp.styleDisableButton
                          : ThemeThisApp.styleButton,
                      onPressed: isPressStart
                          ? null
                          : () {
                              widget.characterAndTheme.getRandomArray();
                              output = widget.characterAndTheme.output;
                              isPressStart = true;
                              isPressCheck = true;
                              isShowNumber = true;
                              currentIndex = 0;
                              startTimer();
                              setState(() {});
                            },
                      child: const Text(
                        "Начать",
                        style: ThemeThisApp.styleTextButton,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
