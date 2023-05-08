import 'package:academia_rost/model/rost_abacus/pb/minus_four.dart';
import 'package:academia_rost/model/rost_abacus/pb/minus_three.dart';
import 'package:academia_rost/model/rost_abacus/pb/minus_two.dart';
import 'package:academia_rost/model/rost_abacus/pb/plus_four.dart';
import 'package:academia_rost/model/rost_abacus/pb/plus_three.dart';
import 'package:academia_rost/model/rost_abacus/pb/plus_two.dart';
import 'package:academia_rost/model/rost_abacus/pd/plus_eight.dart';
import 'package:academia_rost/model/rost_abacus/pd/plus_five.dart';
import 'package:academia_rost/model/rost_abacus/pd/plus_four.dart';
import 'package:academia_rost/model/rost_abacus/pd/plus_nine.dart';
import 'package:academia_rost/model/rost_abacus/pd/plus_one.dart';
import 'package:academia_rost/model/rost_abacus/pd/plus_seven.dart';
import 'package:academia_rost/model/rost_abacus/pd/plus_six.dart';
import 'package:academia_rost/model/rost_abacus/pd/plus_three.dart';
import 'package:academia_rost/model/rost_abacus/pd/plus_two.dart';
import 'package:academia_rost/model/rost_abacus/psv/psv.dart';

import '../model/rost_abacus/generatable.dart';
import '../model/rost_abacus/pb/minus_one.dart';
import '../model/rost_abacus/pb/plus_one.dart';

class TrainerService {
  List<int> getArray(String taskName, int digits, int count) {
    Generatable task = getTask(taskName);
    List<int> responseArray = [];

    int number = 0;
    if (digits == 1) {
      for (int i = 0; i < count; i++) {
        int currentNum = task.head(_splitter(number, 0));
        responseArray.add(currentNum);
        number += currentNum;
      }
    } else {
      for (int i = 0; i < count; i++) {
        int currentNum = task.head(_splitter(number, digits - 1));
        int k = 2;
        while (k <= digits) {
          currentNum = currentNum * 10 +
              task.tail(_splitter(number, digits - k), currentNum >= 0);
          k++;
        }
        responseArray.add(currentNum);
        number += currentNum;
      }
    }
    responseArray.add(number);
    return responseArray;
  }

  int _splitter(int currentNum, int positionFromRight) {
    try {
      String number = currentNum.toString();
      number = number.split('').reversed.join('');
      return int.parse(number[int.parse(positionFromRight as String) - 1]);
    } catch (e) {
      return 0;
    }
  }

  Generatable getTask(String taskName) {
    switch (taskName) {
      case "psvПСВ":
        return PSV();
      case "pb+1":
        return PBPlusOne();
      case "pb-1":
        return PBMinusOne();
      case "pb+2":
        return PBPlusTwo();
      case "pb-2":
        return PBMinusTwo();

      case "pb+3":
        return PBPlusThree();
      case "pb-3":
        return PBMinusThree();
      case "pb+4":
        return PBPlusFour();
      case "pb-4":
        return PBMinusFour();
      case "pd+1":
        return PDPlusOne();
      case "pd+2":
        return PDPlusTwo();
      case "pd+3":
        return PDPlusThree();
      case "pd+4":
        return PDPlusFour();
      case "pd+5":
        return PDPlusFive();
      case "pd+6":
        return PDPlusSix();
      case "pd+7":
        return PDPlusSeven();
      case "pd+8":
        return PDPlusEight();
      case "pd+9":
        return PDPlusNine();
      default:
        return PDPlusNine();
    }
  }
}
