import '../generatable.dart';

class PBPlusTwo with Generatable {
  @override
  int head(int sum) {
    int probab;
    switch (sum) {
      case 0:
        probab = random.nextInt(5) + 1;
        if (probab <= 3) return random.nextInt(4) + 1;
        return random.nextInt(5) + 5;
      case 1:
        probab = random.nextInt(5) + 1;
        if (probab <= 3) {
          return random.nextInt(3) + 1;
        } else {
          return random.nextInt(4) + 5;
        }
      case 2:
        probab = random.nextInt(5) + 1;
        if (probab <= 3) return random.nextInt(2) + 1;
        return random.nextInt(3) + 5;
      case 3:
        return 2;
      case 4:
        if (random.nextBool()) {
          if (random.nextBool()) {
            return 2;
          } else {
            if (random.nextBool()) return 1;
            return 5;
          }
        }
        return -(random.nextInt(4) + 1);
      case 5:
        if (random.nextBool()) return -5;
        return random.nextInt(4) + 1;
      case 6:
        if (random.nextBool()) return -5;
        return random.nextInt(3) + 1;
      case 7:
        if (random.nextBool()) {
          if (random.nextBool()) return -(random.nextInt(3) + 5);
          return -(random.nextInt(2) + 1);
        }
        return random.nextInt(2) + 1;
      case 8:
        if (random.nextBool()) {
          if (random.nextBool()) return -(random.nextInt(4) + 5);
          return -(random.nextInt(3) + 1);
        }
        return -5;
      case 9:
        return -(random.nextInt(9) + 1);
    }
    return sum;
  }

  @override
  int tail(int sum, bool isPlus) {
    int probab;
    switch (sum) {
      case 0:
        if (isPlus) {
          probab = random.nextInt(5) + 1;
          if (probab <= 3) return random.nextInt(4 + 1);
          return random.nextInt(5) + 5;
        }
        return 0;
      case 1:
        if (isPlus) {
          probab = random.nextInt(5) + 1;
          if (probab <= 3) return random.nextInt(3 + 1);
          return random.nextInt(4) + 5;
        }
        return -random.nextInt(2);
      case 2:
        if (isPlus) {
          probab = random.nextInt(5) + 1;
          if (probab <= 3) return random.nextInt(2 + 1);
          return random.nextInt(3) + 5;
        }
        return -random.nextInt(3);
      case 3:
        if (isPlus) return 2;
        return -random.nextInt(4);
      case 4:
        if (isPlus) {
          if (random.nextBool()) return 2;
          return random.nextInt(2) * 5;
        }
        return -(random.nextInt(5));
      case 5:
        if (isPlus) return random.nextInt(5);
        return -(random.nextInt(2) * 5);
      case 6:
        if (isPlus) {
          return random.nextInt(4);
        } else {
          if (random.nextBool()) return -(random.nextInt(2));
          return -(random.nextInt(2) + 5);
        }
      case 7:
        if (isPlus) {
          return random.nextInt(3);
        } else {
          if (random.nextBool()) return -(random.nextInt(3));
          return -(random.nextInt(3) + 5);
        }
      case 8:
        if (isPlus) {
          return random.nextInt(2);
        } else {
          if (random.nextInt(5) + 1 > 3) return -(random.nextInt(4));
          return -(random.nextInt(4) + 5);
        }
      case 9:
        if (isPlus) {
          return 0;
        } else {
          if (random.nextInt(5) + 1 > 3) return -(random.nextInt(5));
          return -(random.nextInt(5) + 5);
        }
    }
    return sum;
  }
}
