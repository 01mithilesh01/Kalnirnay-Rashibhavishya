import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum Themes { dark, light, purple, navyblue, green, teal }

class ThemeHandler extends ChangeNotifier {
  int themenumber = 3;
  String thisvalue = '';
  final SharedPreferences _prefs;
  ThemeHandler(this._prefs) {
    if (_prefs.getInt('numbertheme') == null) {
      themenumber = 3;
    } else {
      themenumber = _prefs.getInt('numbertheme')!;
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
    return this.themenumber;
  }

  set changetheme(Themes theme) {
    int currentthemenumber = findmytheme(theme);
    themenumber = currentthemenumber;
    _prefs.setInt('numbertheme', themenumber);
    notifyListeners();
  }

  int findmytheme(Themes theme) {
    int numbertheme;
    if (theme == Themes.dark) {
      numbertheme = 0;
    } else if (theme == Themes.light) {
      numbertheme = 1;
    } else if (theme == Themes.purple) {
      numbertheme = 2;
    } else if (theme == Themes.navyblue) {
      numbertheme = 3;
    } else if (theme == Themes.green) {
      numbertheme = 4;
    } else {
      numbertheme = 5;
    }
    return numbertheme;
  }
}
