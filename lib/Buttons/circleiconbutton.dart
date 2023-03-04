import 'package:flutter/material.dart';
import 'package:kalnirnay_test/Screens/fireinfopage.dart';
import 'package:kalnirnay_test/Themes/themesbrain.dart';
import 'package:provider/provider.dart';
import '../Themes/themes.dart';
import '../Themes/themehandler.dart';

Mytheme ThisThemeIconButton = Mytheme();

Expanded generatoriconbutton(
    {required int imagenumber,
    required double rad,
    required BuildContext context,
    required String name}) {
  return Expanded(
    child: Column(
      children: [
        Expanded(
          flex: 10,
          child: TextButton(
            style:
                TextButton.styleFrom(primary: Color.fromARGB(255, 3, 31, 109)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => fireinfo(
                          imagenumberthis: imagenumber,
                          nameee: name,
                        )),
              );
            },
            child: Hero(
              transitionOnUserGestures: true,
              tag: imagenumber.toString(),
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: rad,
                child: Image(
                  image: AssetImage('images/icon$imagenumber.png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            name,
            style: returnmediumtextstyle(context: context),
          ),
        ),
      ],
    ),
  );
}
//
