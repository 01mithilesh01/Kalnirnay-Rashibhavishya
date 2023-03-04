import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:kalnirnay_test/Themes/themesbrain.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../Generators/ad_helper.dart';

class info extends StatefulWidget {
  const info({Key? key}) : super(key: key);

  @override
  State<info> createState() => _infoState();
}

class _infoState extends State<info> {
  final String _text = 'https://mobigic.com/';
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
          title: Text(AppLocalizations.of(context)!.info),
          backgroundColor: returnbackgroundcolor(context: context),
          titleTextStyle: returntitletextstyle(context: context)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
        ),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          const SizedBox(
            height: 10,
          ),
          Text(AppLocalizations.of(context)!.first,
              textAlign: TextAlign.center,
              style: returntitletextstyle(context: context)),
          const SizedBox(
            height: 10,
          ),
          Text("About Sumangal",
              textAlign: TextAlign.left,
              style: returnmediumtextstyle(context: context)),
          const SizedBox(
            height: 10,
          ),
          Text(
              "The Sumangal Group is known all over the world as India's premier almanac publisher - 'Kalnirnay'. Since its inception in 1973, the group has emerged as the No. 1 and most authentic almanac publisher, providing up-to-date information about India's festivals, auspicious days and culture of all religions. Kalnirnay Rashibhavishya App is another initiative undertaken by the Sumangal Group to enable its various users to enrich their lives with a facility to access horoscopes based on their Lunar Zodiac Signs on daily, weekly and monthly basis in Marathi language.",
              textAlign: TextAlign.justify,
              style: returnsmalltextstyle(context: context)),
          const SizedBox(
            height: 10,
          ),
          Text("Designed and Developed by:",
              textAlign: TextAlign.justify,
              style: returnsmalltextstyle(context: context)),
          Text("Mobigic™ Technologies Private Limited",
              textAlign: TextAlign.justify,
              style: returnsmalltextstyle(context: context)),
          GestureDetector(
            child: Text(
              _text,
              style: TextStyle(
                color: Colors.blue,
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.bold,
                fontSize: (MediaQuery.of(context).size.height) / 75,
              ),
            ),
            onTap: () {
              launch(_text);
            },
          ),
          const SizedBox(
            height: 10,
          ),
          Text("Copyright:",
              textAlign: TextAlign.justify,
              style: returnsmalltextstyle(context: context)),
          Text(
              "Copyright©2022 Kalnirnay Name and Content - Sumangal Press Pvt. Ltd.",
              textAlign: TextAlign.justify,
              style: returnsmalltextstyle(context: context)),
          const SizedBox(
            height: 10,
          ),
          Text("Disclaimer:",
              textAlign: TextAlign.justify,
              style: returnsmalltextstyle(context: context)),
          Text(
              "Though the utmost care has been taken in preparing this app some spelling / language errors may appear depending on device manufacturer support and/or the resolution of the device/s. User discretion is advised.",
              textAlign: TextAlign.justify,
              style: returnsmalltextstyle(context: context)),
          const SizedBox(
            height: 10,
          ),
          Text(
              "Some of the features in this app may depend upon device RAM / ROM support.",
              textAlign: TextAlign.justify,
              style: returnsmalltextstyle(context: context)),
          const SizedBox(
            height: 10,
          ),
          Text(
              "An astrological prediction is just an opinion of the astrologer. Though all the predictions are provided by a panel of eminent astrologers, the same should not be used as a substitute to an advice of a licensed professional, medical / psychiatric treatment, study, a curriculum, profession or life style. The predictions, opinions and remedial measures of two astrologers on one horoscope may differ and have varied results.",
              textAlign: TextAlign.justify,
              style: returnsmalltextstyle(context: context)),
          const SizedBox(
            height: 10,
          ),
          Text(
              "While all precautions are taken for the accuracy of the contents, the maker of these makes no warranties, either express or implied.",
              textAlign: TextAlign.justify,
              style: returnsmalltextstyle(context: context)),
          const SizedBox(
            height: 10,
          ),
          Text(
            "In case of any disputes, it will be subjected to Mumbai jurisdiction only",
            textAlign: TextAlign.justify,
            style: returnsmalltextstyle(context: context),
          ),
        ]),
      ),
    );
  }
}
