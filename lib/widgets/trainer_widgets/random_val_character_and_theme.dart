import '../../service/trainer_service.dart';

class RandomValCharacterAndTheme {
  String themeName = "";
  double timer = 1.00;
  int digit = 1;
  int count = 1;
  bool isStart = false;
  TrainerService trainerService = TrainerService();
  List<int> output = [0];

  getRandomArray() {
    output = trainerService.getArray(themeName, digit, count);
    print(output);
  }
}
