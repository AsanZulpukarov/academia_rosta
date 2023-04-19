import '../model/rost_abacus/generatable.dart';
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
    responseArray[count] = number;
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
    return PlusOne();
//        throw new SearchException(SearchException.TASK_NOT_FOUND);
  }
}
