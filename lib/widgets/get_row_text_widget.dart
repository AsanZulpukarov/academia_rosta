import 'package:flutter/material.dart';

import '../ThemeThisApp.dart';

class GetRowText {
  static Row getText(String text1, String text2) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Text(
            text1,
            style: ThemeThisApp.styleTextHeader,
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            text2,
            style: ThemeThisApp.styleTextBase,
          ),
        ),
      ],
    );
  }
}
