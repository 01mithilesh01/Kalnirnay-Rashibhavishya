import 'package:flutter/material.dart';
import 'package:kalnirnay_test/Themes/themesbrain.dart';
import 'package:kalnirnay_test/Screens/screennumberholder.dart';

holder Screens = holder();
OutlinedButton buttongenerator(
    {required String text,
    required BuildContext context,
    required int number}) {
  return OutlinedButton(
    style: ButtonStyle(
      overlayColor:
          MaterialStateProperty.all(returnsplashcolor(context: context)),
      elevation: MaterialStateProperty.all(0),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
          side: BorderSide(width: 2, color: returntextcolor(context: context)),
        ),
      ),
      side: MaterialStateProperty.all(BorderSide(
          color: returntextcolor(context: context),
          width: 1.0,
          style: BorderStyle.solid)),
    ),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Screens.listOfScreens[number]),
      );
    },
    child: FittedBox(
      fit: BoxFit.fitWidth,
      alignment: Alignment.center,
      child: Text(
        text,
        style: returnlargetextstyle(context: context),
      ),
    ),
  );
}
