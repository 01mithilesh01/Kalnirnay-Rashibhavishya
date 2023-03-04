import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleProvider extends ChangeNotifier {
  Locale _locale = Locale("mr");
  int langnumber = 0;
  final SharedPreferences _prefs;

  Locale get locale => _locale;

  LocaleProvider(this._prefs) {
    if (_prefs.getInt('lannumber') == null) {
      this._locale = Locale('mr');
      notifyListeners();
    } else {
      langnumber = _prefs.getInt('lannumber')!;
      this._locale = findmylang(langnumber);
      notifyListeners();
    }
  }

  void changeLocale(String _locale) {
    this._locale = Locale(_locale);
    int currentlang = findmyint(_locale);
    _prefs.setInt('lannumber', currentlang);
    notifyListeners();
  }

  int findmyindex() {
    int numberlannng;
    if (_locale == Locale('en')) {
      numberlannng = 0;
    } else if (_locale == Locale('hi')) {
      numberlannng = 1;
    } else if (_locale == Locale('mr')) {
      numberlannng = 2;
    } else {
      numberlannng = 3;
    }
    return numberlannng;
  }

  int findmyint(String locale) {
    int numberlannng2;
    if (locale == 'en') {
      numberlannng2 = 0;
    } else if (locale == 'hi') {
      numberlannng2 = 1;
    } else if (locale == 'mr') {
      numberlannng2 = 2;
    } else {
      numberlannng2 = 3;
    }
    return numberlannng2;
  }

  Locale findmylang(int numbe) {
    Locale checklocale;
    if (numbe == 0) {
      checklocale = Locale('en');
    } else if (numbe == 1) {
      checklocale = Locale('hi');
    } else if (numbe == 2) {
      checklocale = Locale('mr');
    } else {
      checklocale = Locale('gu');
    }
    return checklocale;
  }
}
