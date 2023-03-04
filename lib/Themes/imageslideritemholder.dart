import 'package:flutter/material.dart';
import 'package:kalnirnay_test/Themes/themehandler.dart';
import 'package:kalnirnay_test/Themes/themes.dart';
import 'package:provider/provider.dart';

Mytheme heretheme = Mytheme();
final List<Widget> imageSliders = [
  Padding(
    padding: const EdgeInsets.all(8.0),
    child: PhysicalModel(
      elevation: 8,
      borderRadius: BorderRadius.circular(20),
      color: heretheme.getColor(themetype: 0, type: 'BackgroundColor'),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            width: 3.0,
            color: Colors.white,
          ),
        ),
        child: const Center(
          child: Text(
            'Dark',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ),
  ),
  Padding(
    padding: const EdgeInsets.all(8.0),
    child: PhysicalModel(
      elevation: 8,
      borderRadius: BorderRadius.circular(20),
      color: heretheme.getColor(themetype: 1, type: 'BackgroundColor'),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            width: 3.0,
            color: Colors.black,
          ),
        ),
        child: const Center(
          child: Text(
            'Light',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ),
  ),
  Padding(
    padding: const EdgeInsets.all(8.0),
    child: PhysicalModel(
      elevation: 8,
      borderRadius: BorderRadius.circular(20),
      color: heretheme.getColor(themetype: 2, type: 'BackgroundColor'),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            width: 3.0,
            color: Colors.white,
          ),
        ),
        child: const Center(
          child: Text(
            'Purple',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ),
  ),
  Padding(
    padding: const EdgeInsets.all(8.0),
    child: PhysicalModel(
      elevation: 8,
      borderRadius: BorderRadius.circular(20),
      color: heretheme.getColor(themetype: 3, type: 'BackgroundColor'),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            width: 3.0,
            color: Colors.white,
          ),
        ),
        child: const Center(
          child: Text(
            'NavyBlue',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ),
  ),
  Padding(
    padding: const EdgeInsets.all(8.0),
    child: PhysicalModel(
      elevation: 8,
      borderRadius: BorderRadius.circular(20),
      color: heretheme.getColor(themetype: 4, type: 'BackgroundColor'),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            width: 3.0,
            color: Colors.white,
          ),
        ),
        child: Center(
          child: Text(
            'Green',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ),
  ),
  Padding(
    padding: const EdgeInsets.all(8.0),
    child: PhysicalModel(
      elevation: 8,
      borderRadius: BorderRadius.circular(20),
      color: heretheme.getColor(themetype: 5, type: 'BackgroundColor'),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            width: 3.0,
            color: Colors.white,
          ),
        ),
        child: Center(
          child: Text(
            'Teal',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ),
  )
];

void changemytheme({required int index, required BuildContext context}) {
  if (index == 0) {
    Provider.of<ThemeHandler>(context, listen: false).changetheme = Themes.dark;
  }
  if (index == 1) {
    Provider.of<ThemeHandler>(context, listen: false).changetheme =
        Themes.light;
  }
  if (index == 2) {
    Provider.of<ThemeHandler>(context, listen: false).changetheme =
        Themes.purple;
  }
  if (index == 3) {
    Provider.of<ThemeHandler>(context, listen: false).changetheme =
        Themes.navyblue;
  }
  if (index == 4) {
    Provider.of<ThemeHandler>(context, listen: false).changetheme =
        Themes.green;
  }
  if (index == 5) {
    Provider.of<ThemeHandler>(context, listen: false).changetheme = Themes.teal;
  }
}
