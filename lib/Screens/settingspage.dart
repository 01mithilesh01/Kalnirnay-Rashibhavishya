import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:kalnirnay_test/Generators/languageprovider.dart';
import 'package:kalnirnay_test/Themes/animationhandler.dart';
import 'package:kalnirnay_test/Themes/langslideritemholder.dart';
import 'package:kalnirnay_test/Themes/rashislideritemholder.dart';
import 'package:kalnirnay_test/Themes/themes.dart';
import 'package:provider/provider.dart';
import '../Generators/ad_helper.dart';
import '../Themes/animationsliderholder.dart';
import '../Themes/imageslideritemholder.dart';
import '../Themes/themehandler.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../Themes/themesbrain.dart';
import 'package:carousel_slider/carousel_slider.dart';

class settingtest extends StatefulWidget {
  settingtest({Key? key}) : super(key: key);

  @override
  State<settingtest> createState() => _settingtestState();
}

class _settingtestState extends State<settingtest>
    with TickerProviderStateMixin {
  Mytheme ThisTheme7 = Mytheme();

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Settings',
      home: Scaffold(
        bottomNavigationBar: returnad(),
        backgroundColor: returnbackgroundcolor(context: context),
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios_rounded,
                  color: returniconcolor(context: context))),
          backgroundColor: returnbackgroundcolor(context: context),
          title: Text(AppLocalizations.of(context)!.settings,
              style: returntitletextstyle(context: context)),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Divider(
                height: 20,
                thickness: 2,
                color: returntextcolor(context: context),
              ),
              Text('← Select Rashi →',
                  textAlign: TextAlign.center,
                  style: returnmediumtextstyle(context: context)),
              SizedBox(
                height: 5,
              ),
              CarouselSlider(
                options: CarouselOptions(
                  // autoPlay: true,
                  aspectRatio: 3.0,
                  viewportFraction: 0.35,
                  initialPage: 0,
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) {
                    // changemytheme(index: index, context: context);
                  },
                ),
                items: returnlistofrashislider(context: context),
              ),
              Divider(
                height: 20,
                thickness: 2,
                color: returntextcolor(context: context),
              ),
              Text('← Select Background Color →',
                  textAlign: TextAlign.center,
                  style: returnmediumtextstyle(context: context)),
              CarouselSlider(
                options: CarouselOptions(
                  // autoPlay: true,
                  aspectRatio: 4.0,
                  initialPage: Provider.of<ThemeHandler>(context, listen: false)
                      .returnnumber,
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) {
                    changemytheme(index: index, context: context);
                  },
                ),
                items: imageSliders,
              ),
              Divider(
                height: 20,
                thickness: 2,
                color: returntextcolor(context: context),
              ),
              Text('← Select Language →',
                  textAlign: TextAlign.center,
                  style: returnmediumtextstyle(context: context)),
              CarouselSlider(
                options: CarouselOptions(
                  // autoPlay: true,
                  aspectRatio: 4.0,
                  initialPage:
                      Provider.of<LocaleProvider>(context).findmyindex(),
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) {
                    changemylang(index: index, context: context);
                  },
                ),
                items: returnlistoflangslide(context: context),
              ),
              Divider(
                height: 20,
                thickness: 2,
                color: returntextcolor(context: context),
              ),
              Text('← Select Animation →',
                  textAlign: TextAlign.center,
                  style: returnmediumtextstyle(context: context)),
              CarouselSlider(
                options: CarouselOptions(
                  // autoPlay: true,
                  viewportFraction: 2,
                  scrollDirection: Axis.horizontal,
                  aspectRatio: 3.0,
                  initialPage:
                      Provider.of<AnimatedHandler>(context).returnnumber,
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) {
                    changemyanimation(index: index, context: context);
                  },
                ),
                items: returnanimateslider(vsync: this, context: context),
              ),
              Divider(
                height: 20,
                thickness: 2,
                color: returntextcolor(context: context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}