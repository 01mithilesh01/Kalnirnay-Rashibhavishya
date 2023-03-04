import 'package:flutter/material.dart';
import 'package:kalnirnay_test/Themes/themesbrain.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

List<Widget> returnlistofrashislider({required BuildContext context}) {
  return [
    Column(
      children: [
        Expanded(
          flex: 2,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: (MediaQuery.of(context).size.height) / 20,
            child: Image(
              image: AssetImage('images/icon1.png'),
              fit: BoxFit.contain,
            ),
          ),
        ),
        Expanded(
          child: Text(AppLocalizations.of(context)!.taurus,
              style: returnsmalltextstyle(context: context)),
        ),
      ],
    ),
    Column(
      children: [
        Expanded(
          flex: 2,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: (MediaQuery.of(context).size.height) / 20,
            child: Image(
              image: AssetImage('images/icon2.png'),
              fit: BoxFit.contain,
            ),
          ),
        ),
        Expanded(
          child: Text(AppLocalizations.of(context)!.aries,
              style: returnsmalltextstyle(context: context)),
        ),
      ],
    ),
    Column(
      children: [
        Expanded(
          flex: 2,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: (MediaQuery.of(context).size.height) / 20,
            child: Image(
              image: AssetImage('images/icon3.png'),
              fit: BoxFit.contain,
            ),
          ),
        ),
        Expanded(
          child: Text(AppLocalizations.of(context)!.gemini,
              style: returnsmalltextstyle(context: context)),
        ),
      ],
    ),
    Column(
      children: [
        Expanded(
          flex: 2,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: (MediaQuery.of(context).size.height) / 20,
            child: Image(
              image: AssetImage('images/icon4.png'),
              fit: BoxFit.contain,
            ),
          ),
        ),
        Expanded(
          child: Text(AppLocalizations.of(context)!.cancer,
              style: returnsmalltextstyle(context: context)),
        ),
      ],
    ),
    Column(
      children: [
        Expanded(
          flex: 2,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: (MediaQuery.of(context).size.height) / 20,
            child: Image(
              image: AssetImage('images/icon5.png'),
              fit: BoxFit.contain,
            ),
          ),
        ),
        Expanded(
          child: Text(AppLocalizations.of(context)!.leo,
              style: returnsmalltextstyle(context: context)),
        ),
      ],
    ),
    Column(
      children: [
        Expanded(
          flex: 2,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: (MediaQuery.of(context).size.height) / 20,
            child: Image(
              image: AssetImage('images/icon6.png'),
              fit: BoxFit.contain,
            ),
          ),
        ),
        Expanded(
          child: Text(AppLocalizations.of(context)!.virgo,
              style: returnsmalltextstyle(context: context)),
        ),
      ],
    ),
    Column(
      children: [
        Expanded(
          flex: 2,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: (MediaQuery.of(context).size.height) / 20,
            child: Image(
              image: AssetImage('images/icon7.png'),
              fit: BoxFit.contain,
            ),
          ),
        ),
        Expanded(
          child: Text(AppLocalizations.of(context)!.libra,
              style: returnsmalltextstyle(context: context)),
        ),
      ],
    ),
    Column(
      children: [
        Expanded(
          flex: 2,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: (MediaQuery.of(context).size.height) / 20,
            child: Image(
              image: AssetImage('images/icon8.png'),
              fit: BoxFit.contain,
            ),
          ),
        ),
        Expanded(
          child: Text(AppLocalizations.of(context)!.scorpio,
              style: returnsmalltextstyle(context: context)),
        ),
      ],
    ),
    Column(
      children: [
        Expanded(
          flex: 2,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: (MediaQuery.of(context).size.height) / 20,
            child: Image(
              image: AssetImage('images/icon9.png'),
              fit: BoxFit.contain,
            ),
          ),
        ),
        Expanded(
          child: Text(AppLocalizations.of(context)!.sagittarius,
              style: returnsmalltextstyle(context: context)),
        ),
      ],
    ),
    Column(
      children: [
        Expanded(
          flex: 2,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: (MediaQuery.of(context).size.height) / 20,
            child: Image(
              image: AssetImage('images/icon10.png'),
              fit: BoxFit.contain,
            ),
          ),
        ),
        Expanded(
          child: Text(AppLocalizations.of(context)!.capricon,
              style: returnsmalltextstyle(context: context)),
        ),
      ],
    ),
    Column(
      children: [
        Expanded(
          flex: 2,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: (MediaQuery.of(context).size.height) / 20,
            child: Image(
              image: AssetImage('images/icon11.png'),
              fit: BoxFit.contain,
            ),
          ),
        ),
        Expanded(
          child: Text(AppLocalizations.of(context)!.aquarius,
              style: returnsmalltextstyle(context: context)),
        ),
      ],
    ),
    Column(
      children: [
        Expanded(
          flex: 2,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: (MediaQuery.of(context).size.height) / 20,
            child: Image(
              image: AssetImage('images/icon12.png'),
              fit: BoxFit.contain,
            ),
          ),
        ),
        Expanded(
          child: Text(AppLocalizations.of(context)!.pisces,
              style: returnsmalltextstyle(context: context)),
        ),
      ],
    ),
  ];
}
