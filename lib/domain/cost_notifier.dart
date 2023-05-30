import 'package:flutter/foundation.dart';

class CostNotifier with ChangeNotifier {
  int userBalance = 10000;

  void trade(int ub, int chance) {
    if (ub <= userBalance) {
      if (chance == 1) {
        userBalance = userBalance + ub + (ub * 0.7).toInt();
      }
      if (chance == 0) {
        userBalance = userBalance - ub;
      }
    }
    notifyListeners();
  }
}
