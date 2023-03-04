import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:kalnirnay_test/Themes/themesbrain.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AnimatedHandler extends ChangeNotifier {
  int Animationnumber = 4;
  final SharedPreferences _prefs;

  AnimatedHandler(this._prefs) {
    if (_prefs.getInt('animatedtheme') == null) {
      Animationnumber = 4;
    } else {
      Animationnumber = _prefs.getInt('animatedtheme')!;
    }
  }

  int get returnnumber {
    // Brightness? _currentsetting =
    //     WidgetsBinding.instance.window.platformBrightness;
    // if (_currentsetting == Brightness.dark) {
    //   this.themenumber = 0;
    // } else {
    //   this.themenumber = 1;
    // }
    return Animationnumber;
  }

  set changeanimation(int numanimate) {
    Animationnumber = numanimate;
    _prefs.setInt('animatedtheme', numanimate);
    notifyListeners();
  }
}
