import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kalnirnay_test/Themes/animationhandler.dart';
import 'package:kalnirnay_test/Themes/themes.dart';
import 'package:kalnirnay_test/Themes/themehandler.dart';
import 'package:provider/provider.dart';
import 'package:kalnirnay_test/Themes/themes.dart';

Mytheme TextthemeHandler = Mytheme();

TextStyle returntitletextstyle({required BuildContext context}) {
  return GoogleFonts.poppins(
    textStyle: TextStyle(
        letterSpacing: 1,
        color: TextthemeHandler.getColor(
            themetype: Provider.of<ThemeHandler>(context).themenumber,
            type: "TextColor"),
        fontSize: (MediaQuery.of(context).size.height) / 40,
        fontWeight: FontWeight.bold),
  );
}

TextStyle returnlargetextstyle({required BuildContext context}) {
  return GoogleFonts.poppins(
    textStyle: TextStyle(
        color: TextthemeHandler.getColor(
            themetype: Provider.of<ThemeHandler>(context).themenumber,
            type: "TextColor"),
        fontSize: (MediaQuery.of(context).size.height) / 55,
        fontWeight: FontWeight.bold),
  );
}

TextStyle returnmediumtextstyle({required BuildContext context}) {
  return GoogleFonts.poppins(
    textStyle: TextStyle(
        color: TextthemeHandler.getColor(
            themetype: Provider.of<ThemeHandler>(context).themenumber,
            type: "TextColor"),
        fontSize: (MediaQuery.of(context).size.height) / 60,
        fontWeight: FontWeight.bold),
  );
}

TextStyle returnsmalltextstyle({required BuildContext context}) {
  return GoogleFonts.poppins(
    textStyle: TextStyle(
      color: TextthemeHandler.getColor(
          themetype: Provider.of<ThemeHandler>(context).themenumber,
          type: "TextColor"),
      fontSize: (MediaQuery.of(context).size.height) / 75,
    ),
  );
}

TextStyle returndefaulttextstyle({required BuildContext context}) {
  return GoogleFonts.poppins(
      textStyle: TextStyle(
    color: TextthemeHandler.getColor(
        themetype: Provider.of<ThemeHandler>(context).themenumber,
        type: "TextColor"),
  ));
}

TextStyle returnuniquetextstyle(
    {required BuildContext context, required String type}) {
  return GoogleFonts.poppins(
    textStyle: TextStyle(
      color: TextthemeHandler.getColor(
          themetype: Provider.of<ThemeHandler>(context).themenumber,
          type: type),
    ),
  );
}

TextStyle returncustomtextstyle(
    {required BuildContext context,
    required String type,
    required bool bold,
    required double fontsize,
    required double Letterspacing}) {
  FontWeight currentweight = FontWeight.normal;
  if (bold) {
    currentweight == FontWeight.bold;
  }
  return GoogleFonts.poppins(
    textStyle: TextStyle(
      letterSpacing: Letterspacing,
      fontSize: fontsize,
      color: TextthemeHandler.getColor(
          themetype: Provider.of<ThemeHandler>(context).themenumber,
          type: type),
      fontWeight: currentweight,
    ),
  );
}

TextStyle returnsupercustomtextstyle(
    {required BuildContext context,
    required bool bold,
    required Color color,
    required double fontsize,
    required double Letterspacing}) {
  FontWeight currentweight = FontWeight.normal;
  if (bold) {
    currentweight == FontWeight.bold;
  }
  return GoogleFonts.poppins(
    textStyle: TextStyle(
      letterSpacing: Letterspacing,
      fontSize: fontsize,
      color: color,
      fontWeight: currentweight,
    ),
  );
}

Color returnbackgroundcolor({required BuildContext context}) {
  return TextthemeHandler.getColor(
      themetype: Provider.of<ThemeHandler>(context).themenumber,
      type: 'BackgroundColor');
}

Color returntextcolor({required BuildContext context}) {
  return TextthemeHandler.getColor(
      themetype: Provider.of<ThemeHandler>(context).themenumber,
      type: 'TextColor');
}

Color returnbuttoncolor({required BuildContext context}) {
  return TextthemeHandler.getColor(
      themetype: Provider.of<ThemeHandler>(context).themenumber,
      type: 'ButtonColor');
}

Color returniconcolor({required BuildContext context}) {
  return TextthemeHandler.getColor(
      themetype: Provider.of<ThemeHandler>(context).themenumber,
      type: 'IconColor');
}

Color returnsplashcolor({required BuildContext context}) {
  return TextthemeHandler.getColor(
      themetype: Provider.of<ThemeHandler>(context).themenumber,
      type: 'SplashColor');
}

Behaviour returnanimationbehavior({required BuildContext context}) {
  int currentanimationvalue =
      Provider.of<AnimatedHandler>(context).returnnumber;
  switch (currentanimationvalue) {
    case 0:
      return RandomParticleBehaviour(
        options: ParticleOptions(
          image: Image.asset('images/star.png'),
          baseColor: returnbackgroundcolor(context: context),
          spawnOpacity: 0.0,
          opacityChangeRate: 0.25,
          minOpacity: 0.1,
          maxOpacity: 0.4,
          spawnMinSpeed: 30.0,
          spawnMaxSpeed: 70.0,
          spawnMinRadius: 7.0,
          spawnMaxRadius: 15.0,
          particleCount: 40,
        ),
      );
    case 1:
      return RacingLinesBehaviour();
    case 2:
      return BubblesBehaviour();
    case 3:
      return SpaceBehaviour(
          backgroundColor: returnbackgroundcolor(context: context));
    case 4:
      return EmptyBehaviour();
  }
  return RandomParticleBehaviour();
}
