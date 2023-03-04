import 'package:flutter/material.dart';

// All the themes related information is present in this file
// Dark=0,Light=1

class Mytheme {
  final List<Map> _themes = [
    // Dark Theme
    {
      'BackgroundColor': Colors.blueGrey.shade900,
      'ButtonColor': Colors.blueGrey.shade800,
      'SplashColor': Colors.pink,
      'IconColor': Colors.white,
      'TextColor': Colors.white
    },
    // Light Theme
    {
      'BackgroundColor': Colors.white,
      'ButtonColor': Colors.blueGrey,
      'SplashColor': Colors.grey.shade400,
      'IconColor': Colors.black,
      'TextColor': Colors.black
    },
    // Red Theme
    {
      'BackgroundColor': Colors.purple,
      'ButtonColor': Colors.deepPurple,
      'SplashColor': Colors.pink,
      'IconColor': Colors.white,
      'TextColor': Colors.white
    },
    // Navy Blue
    {
      'BackgroundColor': Color(0xFF021076),
      'ButtonColor': Colors.blue.shade500,
      'SplashColor': Colors.indigo.shade400,
      'IconColor': Colors.white,
      'TextColor': Colors.white
    },
    // Green
    {
      'BackgroundColor': Colors.green.shade900,
      'ButtonColor': Colors.green.shade800,
      'SplashColor': Colors.greenAccent,
      'IconColor': Colors.white,
      'TextColor': Colors.white,
    },
    // Teal
    {
      'BackgroundColor': Colors.teal,
      'ButtonColor': Colors.teal.shade800,
      'SplashColor': Colors.teal.shade900,
      'IconColor': Colors.white,
      'TextColor': Colors.white,
    }
  ];

  Color getColor({required int themetype, required String type}) {
    return _themes[themetype][type];
  }

  String getValue({required int themenumber}) {
    String thisvalue = '';
    if (themenumber == 0) {
      thisvalue = 'Dark';
    } else if (themenumber == 1) {
      thisvalue = 'Light';
    } else if (themenumber == 2) {
      thisvalue = 'Purple';
    } else if (themenumber == 3) {
      thisvalue = 'NavyBlue';
    } else if (themenumber == 4) {
      thisvalue = 'Green';
    } else {
      thisvalue = 'Teal';
    }
    return thisvalue;
  }

  String getlanValue({required Locale mycurrentlocale}) {
    String thisvalue1 = '';
    if (mycurrentlocale == Locale('en')) {
      thisvalue1 = 'English';
    } else if (mycurrentlocale == Locale('hi')) {
      thisvalue1 = 'Hindi';
    } else if (mycurrentlocale == Locale('mr')) {
      thisvalue1 = 'Marathi';
    } else {
      thisvalue1 = 'Gujrati';
    }
    return thisvalue1;
  }
}
