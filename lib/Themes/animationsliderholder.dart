import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:kalnirnay_test/Themes/animationhandler.dart';
import 'package:kalnirnay_test/Themes/themes.dart';
import 'package:kalnirnay_test/Themes/themesbrain.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

Mytheme heretheme = Mytheme();
List<Widget> returnanimateslider(
    {required TickerProviderStateMixin vsync, required BuildContext context}) {
  return [
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: AnimatedBackground(
        vsync: vsync,
        behaviour: RandomParticleBehaviour(
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
        ),
        child: Center(
          child: Text(
            'Stars',
            style: TextStyle(
              color: returntextcolor(context: context),
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: AnimatedBackground(
        vsync: vsync,
        behaviour: RacingLinesBehaviour(),
        child: Center(
          child: Text(
            'Race',
            style: TextStyle(
              color: returntextcolor(context: context),
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: AnimatedBackground(
        vsync: vsync,
        behaviour: BubblesBehaviour(),
        child: Center(
          child: Text(
            'Bubbles',
            style: TextStyle(
              color: returntextcolor(context: context),
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: AnimatedBackground(
        vsync: vsync,
        behaviour: SpaceBehaviour(
            backgroundColor: returnbackgroundcolor(context: context)),
        child: Center(
          child: Text(
            'Space',
            style: TextStyle(
              color: returntextcolor(context: context),
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Text(
          'None',
          style: TextStyle(
            color: returntextcolor(context: context),
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  ];
}

void changemyanimation({required int index, required BuildContext context}) {
  Provider.of<AnimatedHandler>(context, listen: false).changeanimation = index;
}
