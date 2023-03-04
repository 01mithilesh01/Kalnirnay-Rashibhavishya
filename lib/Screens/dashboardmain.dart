import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:kalnirnay_test/Screens/settingspage.dart';
import 'package:kalnirnay_test/Buttons/standardappchangescreenbutton.dart';
import 'package:kalnirnay_test/Themes/themesbrain.dart';
import '../Generators/ad_helper.dart';
import '../Generators/dashboardrowcreator.dart';
import 'help.dart';
import 'package:share_plus/share_plus.dart';
import 'info.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:kalnirnay_test/l10n/l10n.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:animated_background/animated_background.dart';

class dashboard extends StatefulWidget {
  const dashboard({Key? key}) : super(key: key);

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> with TickerProviderStateMixin {
  Future CheckUserConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {}
    } on SocketException catch (_) {
      setState(() {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: returnbackgroundcolor(context: context),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              title: Text(AppLocalizations.of(context)!.alert,
                  textAlign: TextAlign.center,
                  style: returnlargetextstyle(context: context)),
              content: Text(AppLocalizations.of(context)!.alerttext,
                  textAlign: TextAlign.center,
                  style: returndefaulttextstyle(context: context)),
              actionsAlignment: MainAxisAlignment.center,
              actions: [
                OutlinedButton(
                  onPressed: () {
                    // setState(() {
                    //   // Navigator.of(context, rootNavigator: true).pop('dialog');
                    //   // CheckUserConnection();
                    // });
                    SystemNavigator.pop();
                  },
                  style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all(
                          returnsplashcolor(context: context)),
                      shape: MaterialStateProperty.all(
                        const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
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
      });
    }
  }

  Future<InitializationStatus> _initGoogleMobileAds() {
    // TODO: Initialize Google Mobile Ads SDK
    return MobileAds.instance.initialize();
  }

// TODO: Add _bannerAd
  late BannerAd _bannerAd;

// TODO: Add _isBannerAdReady
  bool _isBannerAdReady = false;

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
          print('Failed to load a banner ad: ${err.message}');
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

  @override
  void initState() {
    CheckUserConnection();
    initializemyads();
    super.initState();
    // Todo : If you want to send in app notifications
    // sendNotification(title: 'This is a test', body: 'Testinnnnnnnng!');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: l10n.all,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
      title: AppLocalizations.of(context)!.first,
      home: Scaffold(
        drawer: Drawer(
          backgroundColor: returnbackgroundcolor(context: context),
          child: ListView(
            children: [
              const SizedBox(
                height: 200,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/Kalnirnay.png"),
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  child: SizedBox(),
                ),
              ),
              ListTile(
                selectedTileColor: Colors.transparent,
                leading: const Icon(
                  Icons.share,
                  size: 20,
                ),
                iconColor: returniconcolor(context: context),
                title: Text(AppLocalizations.of(context)!.share,
                    style: returncustomtextstyle(
                        context: context,
                        type: 'TextColor',
                        bold: false,
                        fontsize: 20,
                        Letterspacing: 0)),
                onTap: () async {
                  const urlPreview = 'https://kalnirnayrb.page.link/app';

                  await Share.share(
                      'Download Kalnirnay Rashibhavishya App from\n\n$urlPreview ');
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.info,
                  size: 20,
                ),
                iconColor: returniconcolor(context: context),
                title: Text(AppLocalizations.of(context)!.info,
                    style: returncustomtextstyle(
                        context: context,
                        type: 'TextColor',
                        bold: false,
                        fontsize: 20,
                        Letterspacing: 0)),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const info(),
                      ));
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.help,
                  size: 20,
                ),
                iconColor: returniconcolor(context: context),
                title: Text(AppLocalizations.of(context)!.help,
                    style: returncustomtextstyle(
                        context: context,
                        type: 'TextColor',
                        bold: false,
                        fontsize: 20,
                        Letterspacing: 0)),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => help(),
                      ));
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.settings,
                  size: 20,
                ),
                iconColor: returniconcolor(context: context),
                title: Text(AppLocalizations.of(context)!.settings,
                    style: returncustomtextstyle(
                        context: context,
                        type: 'TextColor',
                        bold: false,
                        fontsize: 20,
                        Letterspacing: 0)),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => settingtest(),
                      ));
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.rate_review,
                  size: 20,
                ),
                iconColor: returniconcolor(context: context),
                title: Text(AppLocalizations.of(context)!.rate,
                    style: returncustomtextstyle(
                        context: context,
                        type: 'TextColor',
                        bold: false,
                        fontsize: 20,
                        Letterspacing: 0)),
                onTap: () async {
                  const url =
                      "https://play.app.goo.gl/?link=https://play.google.com/store/apps/details?id=com.myapp";
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw 'Could not launch $url';
                  }
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          elevation: 0,
          iconTheme: IconThemeData(color: returniconcolor(context: context)),
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              AppLocalizations.of(context)!.first,
              textAlign: TextAlign.center,
              style: returntitletextstyle(context: context),
            ),
          ),
        ),
        backgroundColor: returnbackgroundcolor(context: context),
        body: SafeArea(
          child: AnimatedBackground(
            behaviour: returnanimationbehavior(context: context),
            vsync: this,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    rowcreator(
                        numbers: [1, 2, 3],
                        context: context,
                        Names: [
                          AppLocalizations.of(context)!.taurus,
                          AppLocalizations.of(context)!.aries,
                          AppLocalizations.of(context)!.gemini,
                        ]),
                    rowcreator(
                        numbers: [4, 5, 6],
                        context: context,
                        Names: [
                          AppLocalizations.of(context)!.cancer,
                          AppLocalizations.of(context)!.leo,
                          AppLocalizations.of(context)!.virgo
                        ]),
                    rowcreator(
                        numbers: [7, 8, 9],
                        context: context,
                        Names: [
                          AppLocalizations.of(context)!.libra,
                          AppLocalizations.of(context)!.scorpio,
                          AppLocalizations.of(context)!.sagittarius
                        ]),
                    rowcreator(
                        numbers: [10, 11, 12],
                        context: context,
                        Names: [
                          AppLocalizations.of(context)!.capricon,
                          AppLocalizations.of(context)!.aquarius,
                          AppLocalizations.of(context)!.pisces
                        ]),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      flex: 3,
                      child: buttongenerator(
                          text: AppLocalizations.of(context)!.second,
                          context: context,
                          number: 1),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: returnad(),
      ),
    );
  }
}
