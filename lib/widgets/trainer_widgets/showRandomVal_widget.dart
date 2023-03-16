import 'package:academi_rost/ThemeThisApp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShowRandomValWidget extends StatefulWidget {
  const ShowRandomValWidget({Key? key}) : super(key: key);

  @override
  State<ShowRandomValWidget> createState() => ShowRandomValWidgetState();
}

class ShowRandomValWidgetState extends State<ShowRandomValWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 112.w,
      height: 133.h,
      child: Column(
        children: [
          Container(
              width: 112.w,
              height: 90.h,
              alignment: Alignment.center,
              child: Text(
                "Random",
                style: ThemeThisApp.styleTextHeader,
              )),
          SizedBox(
            width: 112.w,
            height: 42.h,
            child: TextField(
              style: ThemeThisApp.styleTextBase,
              decoration: InputDecoration(
                  label: Text(
                    'Ответ',
                    style: ThemeThisApp.styleTextBase,
                  ),
                  enabledBorder: ThemeThisApp.borderTextField,
                  focusedBorder: ThemeThisApp.borderTextField),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
            ),
          ),
        ],
      ),
    );
  }
}
