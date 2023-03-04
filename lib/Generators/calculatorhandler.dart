import 'package:flutter/material.dart';

class CalciHandler extends ChangeNotifier {
  String statevalue = 'Enter Location';
  String get returnstatevalue {
    return statevalue;
  }

  set changestate(String statename) {
    statevalue = statename;
    notifyListeners();
  }
}
