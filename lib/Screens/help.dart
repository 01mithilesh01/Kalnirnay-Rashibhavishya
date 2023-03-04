import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:kalnirnay_test/Themes/themesbrain.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../Generators/ad_helper.dart';

class help extends StatefulWidget {
  help({Key? key}) : super(key: key);

  @override
  State<help> createState() => _helpState();
}

class _helpState extends State<help> {
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
    initializemyads();
    super.initState();
    // Todo : If you want to send in app notifications
    // sendNotification(title: 'This is a test', body: 'Testinnnnnnnng!');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: returnbackgroundcolor(context: context),
      bottomNavigationBar: returnad(),
      appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios_rounded,
                  color: returniconcolor(context: context))),
          centerTitle: true,
          title: Text(AppLocalizations.of(context)!.help),
          backgroundColor: returnbackgroundcolor(context: context),
          titleTextStyle: returntitletextstyle(context: context)),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          left: 10,
          right: 10,
        ),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          SizedBox(
            height: 10,
          ),
          Text(AppLocalizations.of(context)!.first,
              textAlign: TextAlign.center,
              style: returntitletextstyle(context: context)),
          SizedBox(
            height: 10,
          ),
          Text("Kalnirnay Rashibhavishya v1.6",
              textAlign: TextAlign.left,
              style: returnmediumtextstyle(context: context)),
          SizedBox(
            height: 10,
          ),
          Text(
              "Kalnirnay Rashibhavishya App is an App dedicated to providing horoscope based on 12 Lunar Zodiac Signs. The Hororscopes given are based on the users' Lunar Zodiac Sign which is calculated on the basis of the birth date, birth time and location of the birth place. The Lunar Zodiac Sign is determined on the basis of the position of the moon in that particular Zodiac Sign at the time of birth.",
              textAlign: TextAlign.justify,
              style: returnsmalltextstyle(context: context)),
          SizedBox(
            height: 10,
          ),
          Text(
              "The features in the Kalnirnay Rashibhavishya App are as follows:",
              textAlign: TextAlign.justify,
              style: returnsmalltextstyle(context: context)),
          SizedBox(
            height: 10,
          ),
          Text("• Daily Horoscope which is updated on a daily basis",
              textAlign: TextAlign.justify,
              style: returnsmalltextstyle(context: context)),
          SizedBox(
            height: 10,
          ),
          Text(
              "• Weekly Horoscope which is updated on a weekly basis Monthly Horoscope which is updated on a monthly basis",
              textAlign: TextAlign.justify,
              style: returnsmalltextstyle(context: context)),
          SizedBox(
            height: 10,
          ),
          Text(
              "• Lunar Zodiac Sign Calculator which lets users calculate their individual lunar zodiac sign based on birth date, birth time and location of the birth place.",
              textAlign: TextAlign.justify,
              style: returnsmalltextstyle(context: context)),
          SizedBox(
            height: 10,
          ),
          Text(
              "• Widget can be added to home screen or any other screen for each Lunar Zodiac Sign",
              textAlign: TextAlign.justify,
              style: returnsmalltextstyle(context: context)),
          SizedBox(
            height: 10,
          ),
          Text(
            "• Customization to change background colour and pattern as per user requirement and choice.",
            textAlign: TextAlign.justify,
            style: returnsmalltextstyle(context: context),
          ),
        ]),
      ),
    );
  }
}
