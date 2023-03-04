import 'package:flutter/material.dart';
import 'package:kalnirnay_test/Themes/themes.dart';
import 'package:kalnirnay_test/Themes/themesbrain.dart';
import 'package:provider/provider.dart';
import '../Generators/languageprovider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Mytheme heretheme = Mytheme();
List<Widget> lunarslider({required BuildContext context}) {
  return [
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: PhysicalModel(
        elevation: 8,
        borderRadius: BorderRadius.circular(20),
        color: returnbackgroundcolor(context: context),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              width: 3.0,
              color: returntextcolor(context: context),
            ),
          ),
          child: Center(
            child: Text(
              AppLocalizations.of(context)!.taurus,
              style: TextStyle(
                color: returntextcolor(context: context),
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
        color: returnbackgroundcolor(context: context),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
                width: 3.0, color: returntextcolor(context: context)),
          ),
          child: Center(
            child: Text(
  AppLocalizations.of(context)!.aries,
              style: TextStyle(
                color: returntextcolor(context: context),
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
        color: returnbackgroundcolor(context: context),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              width: 3.0,
              color: returntextcolor(context: context),
            ),
          ),
          child: Center(
            child: Text(
              AppLocalizations.of(context)!.gemini,
              style: TextStyle(
                color: returntextcolor(context: context),
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
        color: returnbackgroundcolor(context: context),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              width: 3.0,
              color: returntextcolor(context: context),
            ),
          ),
          child: Center(
            child: Text(
              AppLocalizations.of(context)!.cancer,
              style: TextStyle(
                color: returntextcolor(context: context),
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
        color: returnbackgroundcolor(context: context),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
                width: 3.0, color: returntextcolor(context: context)),
          ),
          child: Center(
            child: Text(
              AppLocalizations.of(context)!.leo,
              style: TextStyle(
                color: returntextcolor(context: context),
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
        color: returnbackgroundcolor(context: context),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
                width: 3.0, color: returntextcolor(context: context)),
          ),
          child: Center(
            child: Text(
  AppLocalizations.of(context)!.virgo,
              style: TextStyle(
                color: returntextcolor(context: context),
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
        color: returnbackgroundcolor(context: context),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
                width: 3.0, color: returntextcolor(context: context)),
          ),
          child: Center(
            child: Text(
              AppLocalizations.of(context)!.libra,
              style: TextStyle(
                color: returntextcolor(context: context),
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
        color: returnbackgroundcolor(context: context),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
                width: 3.0, color: returntextcolor(context: context)),
          ),
          child: Center(
            child: Text(
              AppLocalizations.of(context)!.scorpio,
              style: TextStyle(
                color: returntextcolor(context: context),
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
        color: returnbackgroundcolor(context: context),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
                width: 3.0, color: returntextcolor(context: context)),
          ),
          child: Center(
            child: Text(
              AppLocalizations.of(context)!.sagittarius,
              style: TextStyle(
                color: returntextcolor(context: context),
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
        color: returnbackgroundcolor(context: context),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
                width: 3.0, color: returntextcolor(context: context)),
          ),
          child: Center(
            child: Text(
              AppLocalizations.of(context)!.capricon,
              style: TextStyle(
                color: returntextcolor(context: context),
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
        color: returnbackgroundcolor(context: context),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
                width: 3.0, color: returntextcolor(context: context)),
          ),
          child: Center(
            child: Text(
              AppLocalizations.of(context)!.aquarius,
              style: TextStyle(
                color: returntextcolor(context: context),
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
        color: returnbackgroundcolor(context: context),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
                width: 3.0, color: returntextcolor(context: context)),
          ),
          child: Center(
            child: Text(
              AppLocalizations.of(context)!.pisces,
              style: TextStyle(
                color: returntextcolor(context: context),
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    ),
  ];
}

void changemylang({required int index, required BuildContext context}) {
  if (index == 0) {
    context.read<LocaleProvider>().changeLocale('en');
  }
  if (index == 1) {
    context.read<LocaleProvider>().changeLocale('hi');
  }
  if (index == 2) {
    context.read<LocaleProvider>().changeLocale('mr');
  }
  if (index == 3) {
    context.read<LocaleProvider>().changeLocale('gu');
  }
}
