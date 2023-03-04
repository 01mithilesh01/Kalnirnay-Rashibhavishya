import 'package:animated_background/animated_background.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kalnirnay_test/Buttons/circleiconbutton.dart';
import 'package:kalnirnay_test/Buttons/standardappbutton.dart';
import 'package:kalnirnay_test/Generators/rashicalci.dart';
import 'package:kalnirnay_test/Themes/themesbrain.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:geocoding/geocoding.dart';
import '../Generators/ad_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:flutter/services.dart';

import 'fireinfopage.dart';

class calcipageroute extends StatefulWidget {
  const calcipageroute({Key? key}) : super(key: key);

  @override
  State<calcipageroute> createState() => _calcipagerouteState();
}

class _calcipagerouteState extends State<calcipageroute>
    with TickerProviderStateMixin {
  DateTime date = DateTime.now();
  TimeOfDay time = TimeOfDay.now();
  ZODIAC_SIGN sign = ZODIAC_SIGN.ZODIAC_NONE;
  static const platform = MethodChannel('com.flutter.javacalci/javacalci');
  Future<InitializationStatus> _initGoogleMobileAds() {
    // TODO: Initialize Google Mobile Ads SDK
    return MobileAds.instance.initialize();
  }

// TODO: Add _bannerAd
  late BannerAd _bannerAd;

// TODO: Add _isBannerAdReady
  bool _isBannerAdReady = false;

  void calculaterashi() async {
    String valrashi = '';
    try {
      valrashi = await platform.invokeMethod('Showme');
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    if (kDebugMode) {
      print(valrashi);
    }
  }

  Future<void> initializemyads() async {
    _initGoogleMobileAds();
    _bannerAd = BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      request: AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (_) {
          setState(() {
            _isBannerAdReady = true;
          });
        },
        onAdFailedToLoad: (ad, err) {
          if (kDebugMode) {
            print('Failed to load a banner ad: ${err.message}');
          }
          _isBannerAdReady = false;
          ad.dispose();
        },
      ),
    );

    _bannerAd.load();
  }

  Widget returnad() {
    if (_isBannerAdReady) {
      return Container(
        width: _bannerAd.size.width.toDouble(),
        height: _bannerAd.size.height.toDouble(),
        child: AdWidget(ad: _bannerAd),
      );
    } else {
      return SizedBox();
    }
  }

  Future<void> Displaypicker() async {
    DateTime? newDate = await showDatePicker(
      keyboardType: TextInputType.text,
      context: context,
      initialDate: date,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: ThemeData(
            dialogBackgroundColor: returnbackgroundcolor(context: context),
            dialogTheme: DialogTheme(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    16.0), // this is the border radius of the picker
              ),
            ),
            colorScheme: ColorScheme(
                brightness: Brightness.dark,
                primary: returnbuttoncolor(context: context),
                onPrimary: returntextcolor(context: context),
                secondary: returnbackgroundcolor(context: context),
                onSecondary: returntextcolor(context: context),
                error: returnbackgroundcolor(context: context),
                onError: returntextcolor(context: context),
                background: returnbackgroundcolor(context: context),
                onBackground: returntextcolor(context: context),
                surface: returnbackgroundcolor(context: context),
                onSurface: returntextcolor(context: context)),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                  primary:
                      returntextcolor(context: context) // button text color
                  ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (newDate == null) return;

    setState(() => date = newDate);
  }

  Future<void> Displaytimepicker() async {
    TimeOfDay? newTime = await showTimePicker(
      context: context,
      helpText: '',
      initialTime: time,
      builder: (context, child) {
        return Theme(
          data: ThemeData(
            timePickerTheme: TimePickerThemeData(
              dayPeriodBorderSide: BorderSide(
                  color: returntextcolor(context: context), width: 2),
              dayPeriodColor: MaterialStateColor.resolveWith((states) =>
                  states.contains(MaterialState.selected)
                      ? returntextcolor(context: context)
                      : returnbackgroundcolor(context: context)),
              dayPeriodTextColor: MaterialStateColor.resolveWith((states) =>
                  states.contains(MaterialState.selected)
                      ? returnbackgroundcolor(context: context)
                      : returntextcolor(context: context)),
              dayPeriodShape: RoundedRectangleBorder(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                side: BorderSide(
                    color: returntextcolor(context: context), width: 2),
              ),
              hourMinuteColor: MaterialStateColor.resolveWith((states) =>
                  states.contains(MaterialState.selected)
                      ? returntextcolor(context: context)
                      : returnbackgroundcolor(context: context)),
              hourMinuteTextColor: MaterialStateColor.resolveWith((states) =>
                  states.contains(MaterialState.selected)
                      ? returnbackgroundcolor(context: context)
                      : returntextcolor(context: context)),
              entryModeIconColor: returniconcolor(context: context),
              dialBackgroundColor: returnbackgroundcolor(context: context),
              dialHandColor: returnbuttoncolor(context: context),
              dialTextColor: returntextcolor(context: context),
              backgroundColor: returnbackgroundcolor(context: context),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              hourMinuteShape: const CircleBorder(),
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                  primary:
                      returntextcolor(context: context) // button text color
                  ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (newTime == null) return;

    setState(() => time = newTime);
  }

  Future<void> DisplayAlertwithtextfield() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: returnbackgroundcolor(context: context),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))),
          title: Text(AppLocalizations.of(context)!.first,
              textAlign: TextAlign.center,
              style: returnlargetextstyle(context: context)),
          content: TextField(
            textAlign: TextAlign.center,
            style: returndefaulttextstyle(context: context),
            controller: _textFieldController,
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context)!.location,
              hintStyle:
                  returnuniquetextstyle(context: context, type: 'ButtonColor'),
              enabledBorder: UnderlineInputBorder(
                borderSide:
                    BorderSide(color: returnbuttoncolor(context: context)),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide:
                    BorderSide(color: returntextcolor(context: context)),
              ),
            ),
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            OutlinedButton(
              onPressed: () async {
                try {
                  locations =
                      await locationFromAddress(_textFieldController.text);
                  setState(() {
                    // 29, 12, 2020, 18, 36, 5, 30, 77, 12, 28, 36, false, true, false
                    sign = calculate(
                        date.day.toDouble(),
                        date.month.toDouble(),
                        date.year.toDouble(),
                        time.hour.toDouble(),
                        time.minute.toDouble(),
                        5,
                        30,
                        locations[0].longitude,
                        12,
                        locations[0].latitude,
                        36,
                        false,
                        true,
                        false);
                    locattt = _textFieldController.text;
                    calculaterashi();
                  });
                  Navigator.of(context, rootNavigator: true).pop('dialog');
// SystemNavigator.pop();
                } catch (e) {
                  setState(() {
                    locations = ['Please Enter A Valid Address'];
                  });
                  Navigator.of(context, rootNavigator: true).pop('dialog');
                }
              },
              style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(
                      returnsplashcolor(context: context)),
                  shape: MaterialStateProperty.all(
                    const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                  ),
                  side: MaterialStateProperty.all(BorderSide(
                      color: returntextcolor(context: context),
                      width: 2.0,
                      style: BorderStyle.solid))),
              child: SizedBox(
                width: double.infinity,
                child: Text(AppLocalizations.of(context)!.alertbuttontext,
                    textAlign: TextAlign.center,
                    style: returndefaulttextstyle(context: context)),
              ),
            )
          ],
        );
      },
    );
  }

  TextEditingController _textFieldController = TextEditingController();
  String locattt = 'Not Selected';
  List locations = [];

  @override
  void initState() {
    initializemyads();
    super.initState();
    // Todo : If you want to send in app notifications
    // sendNotification(title: 'This is a test', body: 'Testinnnnnnnng!');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: returnad(),
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios_rounded,
                  color: returniconcolor(context: context))),
          backgroundColor: Colors.transparent,
          title: Text(AppLocalizations.of(context)!.second,
              style: returntitletextstyle(context: context)),
          centerTitle: true,
        ),
        backgroundColor: returnbackgroundcolor(context: context),
        body: SafeArea(
          child: AnimatedBackground(
            behaviour: returnanimationbehavior(context: context),
            vsync: this,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      returnbuttonstandard(
                          context: context,
                          onClicked: Displaypicker,
                          Title: AppLocalizations.of(context)!.enter,
                          Subtitle: "${date.day}/${date.month}/${date.year}",
                          Leading: Icons.date_range_rounded,
                          Trailing: Icons.keyboard_arrow_right),
                      returnbuttonstandard(
                          context: context,
                          onClicked: Displaytimepicker,
                          Title: AppLocalizations.of(context)!.time,
                          Subtitle: "${time.hour}:${time.minute}",
                          Leading: Icons.access_time_rounded,
                          Trailing: Icons.keyboard_arrow_right),
                      returnbuttonstandard(
                          context: context,
                          onClicked: DisplayAlertwithtextfield,
                          Title: AppLocalizations.of(context)!.location,
                          Subtitle: locattt,
                          Leading: Icons.location_on_outlined,
                          Trailing: Icons.keyboard_arrow_right),
                      Container(
                        child: returnsignnumber(sign) == 0
                            ? SizedBox()
                            : Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Your Rashi: ",
                                        style: returnmediumtextstyle(
                                            context: context)),
                                  ),
                                  SizedBox(
                                    height: 200,
                                    child: TextButton(
                                      style: TextButton.styleFrom(
                                          primary:
                                              Color.fromARGB(255, 3, 31, 109)),
                                      onPressed: () {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => fireinfo(
                                                    imagenumberthis:
                                                        returnsignnumber(sign),
                                                    nameee: returnsignname(
                                                        sign, context),
                                                  )),
                                        );
                                      },
                                      child: Hero(
                                        transitionOnUserGestures: true,
                                        tag: returnsignnumber(sign).toString(),
                                        child: CircleAvatar(
                                          backgroundColor: Colors.transparent,
                                          radius: (MediaQuery.of(context)
                                                  .size
                                                  .height) /
                                              20,
                                          child: Image(
                                            image: AssetImage(
                                                'images/icon${returnsignnumber(sign)}.png'),
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(returnsignname(sign, context),
                                      style: returnlargetextstyle(
                                          context: context)),
                                ],
                              ),
                      )
                    ],
                  ),
                  // Center(
                  //   child: Text(sign.toString(),
                  //       textAlign: TextAlign.center,
                  //       style: returndefaulttextstyle(context: context)),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

int returnsignnumber(ZODIAC_SIGN mysign) {
  if (mysign == ZODIAC_SIGN.ZODIAC_NONE) {
    return 0;
  } else if (mysign == ZODIAC_SIGN.ZODIAC_TAURUS) {
    return 1;
  } else if (mysign == ZODIAC_SIGN.ZODIAC_ARIES) {
    return 2;
  } else if (mysign == ZODIAC_SIGN.ZODIAC_GEMINI) {
    return 3;
  } else if (mysign == ZODIAC_SIGN.ZODIAC_CANCER) {
    return 4;
  } else if (mysign == ZODIAC_SIGN.ZODIAC_LEO) {
    return 5;
  } else if (mysign == ZODIAC_SIGN.ZODIAC_VIRGO) {
    return 6;
  } else if (mysign == ZODIAC_SIGN.ZODIAC_LIBRA) {
    return 7;
  } else if (mysign == ZODIAC_SIGN.ZODIAC_SCORPIO) {
    return 8;
  } else if (mysign == ZODIAC_SIGN.ZODIAC_SAGITARRIUS) {
    return 9;
  } else if (mysign == ZODIAC_SIGN.ZODIAC_CAPRICORN) {
    return 10;
  } else if (mysign == ZODIAC_SIGN.ZODIAC_AQUARIUS) {
    return 11;
  } else if (mysign == ZODIAC_SIGN.ZODIAC_PISCES) {
    return 12;
  }
  return 0;
}

String returnsignname(ZODIAC_SIGN mysign, BuildContext context) {
  if (mysign == ZODIAC_SIGN.ZODIAC_NONE) {
    return "";
  } else if (mysign == ZODIAC_SIGN.ZODIAC_TAURUS) {
    return AppLocalizations.of(context)!.taurus;
  } else if (mysign == ZODIAC_SIGN.ZODIAC_ARIES) {
    return AppLocalizations.of(context)!.aries;
  } else if (mysign == ZODIAC_SIGN.ZODIAC_GEMINI) {
    return AppLocalizations.of(context)!.gemini;
  } else if (mysign == ZODIAC_SIGN.ZODIAC_CANCER) {
    return AppLocalizations.of(context)!.cancer;
  } else if (mysign == ZODIAC_SIGN.ZODIAC_LEO) {
    return AppLocalizations.of(context)!.leo;
  } else if (mysign == ZODIAC_SIGN.ZODIAC_VIRGO) {
    return AppLocalizations.of(context)!.virgo;
  } else if (mysign == ZODIAC_SIGN.ZODIAC_LIBRA) {
    return AppLocalizations.of(context)!.libra;
  } else if (mysign == ZODIAC_SIGN.ZODIAC_SCORPIO) {
    return AppLocalizations.of(context)!.scorpio;
  } else if (mysign == ZODIAC_SIGN.ZODIAC_SAGITARRIUS) {
    return AppLocalizations.of(context)!.sagittarius;
  } else if (mysign == ZODIAC_SIGN.ZODIAC_CAPRICORN) {
    return AppLocalizations.of(context)!.capricon;
  } else if (mysign == ZODIAC_SIGN.ZODIAC_AQUARIUS) {
    return AppLocalizations.of(context)!.aquarius;
  } else if (mysign == ZODIAC_SIGN.ZODIAC_PISCES) {
    return AppLocalizations.of(context)!.pisces;
  }
  return "";
}
