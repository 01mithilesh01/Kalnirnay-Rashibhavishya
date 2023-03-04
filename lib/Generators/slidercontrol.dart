import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SizeSliderHandler extends ChangeNotifier {
  double sizeslider = 15;
  final SharedPreferences _prefs;
  SizeSliderHandler(this._prefs) {
    if (_prefs.getDouble('sizeslider') == null) {
      sizeslider = 15;
    } else {
      sizeslider = _prefs.getDouble('sizeslider')!;
    }
  }

  double get returnsize {
    // Brightness? _currentsetting =
    //     WidgetsBinding.instance.window.platformBrightness;
    // if (_currentsetting == Brightness.dark) {
    //   this.themenumber = 0;
    // } else {
    //   this.themenumber = 1;
    // }
    return this.sizeslider;
  }

  set changenumber(double nummsize) {
    sizeslider = nummsize;
    _prefs.setDouble('sizeslider', nummsize);
    notifyListeners();
  }
}
