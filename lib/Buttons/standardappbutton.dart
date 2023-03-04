import 'package:flutter/material.dart';
import '../Themes/themesbrain.dart';

Padding returnbuttonstandard(
    {required BuildContext context,
    required var onClicked,
    required String Title,
    required String Subtitle,
    required IconData Leading,
    required IconData Trailing}) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: TextButton(
      style: ButtonStyle(
        overlayColor:
            MaterialStateProperty.all(returnsplashcolor(context: context)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
            side:
                BorderSide(width: 2, color: returntextcolor(context: context)),
          ),
        ),
      ),
      onPressed: onClicked,
      child: ListTile(
        title: Text(Title, style: returnmediumtextstyle(context: context)),
        subtitle: Text(Subtitle, style: returnsmalltextstyle(context: context)),
        leading: Icon(Leading, color: returniconcolor(context: context)),
        trailing: Icon(Trailing, color: returniconcolor(context: context)),
      ),
    ),
  );
}
