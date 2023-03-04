import 'dart:io';
import 'package:animated_background/animated_background.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kalnirnay_test/Screens/home.dart';
import 'package:kalnirnay_test/Themes/themesbrain.dart';
import 'package:kalnirnay_test/l10n/l10n.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Generators/languageprovider.dart';
import '../Themes/animationhandler.dart';
import '../Themes/animationsliderholder.dart';
import '../Themes/themehandler.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: Provider.of<LocaleProvider>(context, listen: true).locale,
      supportedLocales: l10n.all,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      title: 'Introduction screen',
      debugShowCheckedModeBanner: false,
      home: OnBoardingPage(),
    );
  }
}

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage>
    with TickerProviderStateMixin {
  final introKey = GlobalKey<IntroductionScreenState>();

  Future<void> _onIntroEnd(context) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('introdonecheck', true);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => centre()),
    );
  }

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('images/$assetName', width: width);
  }

  bool _hasBeenPressed = false;
  bool _hasBeenPressed1 = false;
  bool _hasBeenPressed2 = true;
  bool _hasBeenPressed3 = false;
  bool _hasColorBeenPressed1 = false;
  bool _hasColorBeenPressed2 = false;
  bool _hasColorBeenPressed3 = false;
  bool _hasColorBeenPressed4 = true;
  bool _hasColorBeenPressed5 = false;
  bool _hasColorBeenPressed6 = false;
  bool _hasanimatedBeenPressed = false;
  bool _hasanimatedBeenPressed1 = false;
  bool _hasanimatedBeenPressed2 = false;
  bool _hasanimatedBeenPressed3 = false;
  bool _hasanimatedBeenPressed4 = true;
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

  @override
  void initState() {
    CheckUserConnection();
    super.initState();
    // Todo : If you want to send in app notifications
    // sendNotification(title: 'This is a test', body: 'Testinnnnnnnng!');
  }

  @override
  Widget build(BuildContext context) {
    TextStyle bodyStyle =
        TextStyle(fontSize: 19.0, color: returnbuttoncolor(context: context));

    PageDecoration pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(
          fontSize: 28.0,
          fontWeight: FontWeight.w700,
          color: returntextcolor(context: context)),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: returnbackgroundcolor(context: context),
      imagePadding: EdgeInsets.zero,
    );

    TextStyle Mytextstyle() {
      return GoogleFonts.poppins(
          textStyle: TextStyle(
              color: returnbuttoncolor(context: context),
              fontSize: 25,
              fontWeight: FontWeight.bold));
    }

    TextStyle Mytextstyle2() {
      return GoogleFonts.poppins(
          textStyle: TextStyle(
              color: returnbuttoncolor(context: context),
              fontSize: (MediaQuery.of(context).size.height) / 61,
              fontWeight: FontWeight.bold));
    }

    TextStyle Mytextstyle3() {
      return GoogleFonts.poppins(
          textStyle: TextStyle(
              color: returntextcolor(context: context),
              fontSize: (MediaQuery.of(context).size.height) / 61,
              fontWeight: FontWeight.bold));
    }

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: returnbackgroundcolor(context: context),
      pages: [
        PageViewModel(
          useScrollView: true,
          title: '',
          image: _buildImage('Kalnirnay.png'),
          bodyWidget: AnimatedTextKit(
            repeatForever: true,
            animatedTexts: [
              RotateAnimatedText('Welcome to Kalnirnay Rashibhavishya',
                  duration: const Duration(seconds: 3),
                  textAlign: TextAlign.center,
                  textStyle: Mytextstyle()),
              RotateAnimatedText('कालनिर्णय राशिभविष्य मध्ये आपले स्वागत आहे',
                  duration: const Duration(seconds: 3),
                  textAlign: TextAlign.center,
                  textStyle: Mytextstyle()),
              RotateAnimatedText('कालनिर्णय राशिभविष्य में आपका स्वागत है',
                  duration: const Duration(seconds: 3),
                  textAlign: TextAlign.center,
                  textStyle: Mytextstyle()),
              RotateAnimatedText('કાલનિર્ણય રાશિભવિષ્યમાં આપનું સ્વાગત છે',
                  duration: const Duration(seconds: 3),
                  textAlign: TextAlign.center,
                  textStyle: Mytextstyle())
            ],
          ),
          decoration: pageDecoration,
        ),
        PageViewModel(
          useScrollView: true,
          titleWidget: Text(
            AppLocalizations.of(context)!.language,
            style: Mytextstyle(),
          ),
          bodyWidget: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Column(
                  children: [
                    TextButton(
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                            EdgeInsets.all(50),
                          ),
                          backgroundColor: MaterialStateProperty.all(
                            _hasBeenPressed
                                ? returnbuttoncolor(context: context)
                                : returnsplashcolor(context: context),
                          ),
                          overlayColor:
                              MaterialStateProperty.all(Colors.transparent),
                          elevation: MaterialStateProperty.all(15),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      side: BorderSide(
                                        color: _hasBeenPressed
                                            ? returntextcolor(context: context)
                                            : returnsplashcolor(
                                                context: context),
                                      )))),
                      onPressed: () {
                        setState(() {
                          _hasBeenPressed1 = false;
                          _hasBeenPressed2 = false;
                          _hasBeenPressed3 = false;
                          _hasBeenPressed = true;
                          context.read<LocaleProvider>().changeLocale('en');
                        });
                      },
                      child: Container(
                        child: Text(
                          'English',
                          style:
                              _hasBeenPressed ? Mytextstyle3() : Mytextstyle2(),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextButton(
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                            EdgeInsets.all(50),
                          ),
                          backgroundColor: MaterialStateProperty.all(
                            _hasBeenPressed1
                                ? returnbuttoncolor(context: context)
                                : returnsplashcolor(context: context),
                          ),
                          overlayColor:
                              MaterialStateProperty.all(Colors.transparent),
                          elevation: MaterialStateProperty.all(15),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      side: BorderSide(
                                        color: _hasBeenPressed1
                                            ? returntextcolor(context: context)
                                            : returnsplashcolor(
                                                context: context),
                                      )))),
                      onPressed: () {
                        setState(() {
                          _hasBeenPressed2 = false;
                          _hasBeenPressed3 = false;
                          _hasBeenPressed = false;
                          _hasBeenPressed1 = true;
                          context.read<LocaleProvider>().changeLocale('hi');
                        });
                      },
                      child: Container(
                        child: Text(
                          "   हिन्दी   ",
                          style: _hasBeenPressed1
                              ? Mytextstyle3()
                              : Mytextstyle2(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  children: [
                    TextButton(
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                            EdgeInsets.all(50),
                          ),
                          backgroundColor: MaterialStateProperty.all(
                            _hasBeenPressed2
                                ? returnbuttoncolor(context: context)
                                : returnsplashcolor(context: context),
                          ),
                          overlayColor:
                              MaterialStateProperty.all(Colors.transparent),
                          elevation: MaterialStateProperty.all(15),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      side: BorderSide(
                                        color: _hasBeenPressed2
                                            ? returntextcolor(context: context)
                                            : returnsplashcolor(
                                                context: context),
                                      )))),
                      onPressed: () {
                        setState(() {
                          _hasBeenPressed1 = false;
                          _hasBeenPressed3 = false;
                          _hasBeenPressed = false;
                          _hasBeenPressed2 = true;
                          context.read<LocaleProvider>().changeLocale('mr');
                        });
                      },
                      child: Container(
                        child: Text(
                          "   मराठी   ",
                          style: _hasBeenPressed2
                              ? Mytextstyle3()
                              : Mytextstyle2(),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextButton(
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                            EdgeInsets.all(50),
                          ),
                          backgroundColor: MaterialStateProperty.all(
                            _hasBeenPressed3
                                ? returnbuttoncolor(context: context)
                                : returnsplashcolor(context: context),
                          ),
                          overlayColor:
                              MaterialStateProperty.all(Colors.transparent),
                          elevation: MaterialStateProperty.all(15),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      side: BorderSide(
                                        color: _hasBeenPressed3
                                            ? returntextcolor(context: context)
                                            : returnsplashcolor(
                                                context: context),
                                      )))),
                      onPressed: () {
                        setState(() {
                          _hasBeenPressed1 = false;
                          _hasBeenPressed2 = false;
                          _hasBeenPressed = false;
                          _hasBeenPressed3 = true;
                          context.read<LocaleProvider>().changeLocale('gu');
                        });
                      },
                      child: Container(
                        child: Text(
                          ' ગુજરાતી ',
                          style: _hasBeenPressed3
                              ? Mytextstyle3()
                              : Mytextstyle2(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          decoration: PageDecoration(
            bodyAlignment: Alignment.center,
            titleTextStyle: Mytextstyle(),
            bodyTextStyle: bodyStyle,
            bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
            pageColor: returnbackgroundcolor(context: context),
            imagePadding: EdgeInsets.zero,
          ),
        ),
        PageViewModel(
          useScrollView: true,
          titleWidget: Text(
            AppLocalizations.of(context)!.colour,
            style: Mytextstyle(),
          ),
          bodyWidget: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    TextButton(
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                            EdgeInsets.all(50),
                          ),
                          backgroundColor: MaterialStateProperty.all(
                            heretheme.getColor(
                                themetype: 0, type: 'BackgroundColor'),
                          ),
                          overlayColor:
                              MaterialStateProperty.all(Colors.transparent),
                          elevation: MaterialStateProperty.all(15),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      side: BorderSide(
                                        color: _hasColorBeenPressed1
                                            ? heretheme.getColor(
                                                themetype: 0, type: 'TextColor')
                                            : Colors.transparent,
                                      )))),
                      onPressed: () {
                        setState(() {
                          _hasColorBeenPressed6 = false;
                          _hasColorBeenPressed2 = false;
                          _hasColorBeenPressed3 = false;
                          _hasColorBeenPressed4 = false;
                          _hasColorBeenPressed5 = false;
                          _hasColorBeenPressed1 = true;
                          Provider.of<ThemeHandler>(context, listen: false)
                              .changetheme = Themes.dark;
                        });
                      },
                      child: Container(
                        child: Text(' Dark ',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize:
                                        (MediaQuery.of(context).size.height) /
                                            67,
                                    fontWeight: FontWeight.bold))),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextButton(
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                            EdgeInsets.all(50),
                          ),
                          backgroundColor: MaterialStateProperty.all(
                            heretheme.getColor(
                                themetype: 1, type: 'BackgroundColor'),
                          ),
                          overlayColor:
                              MaterialStateProperty.all(Colors.transparent),
                          elevation: MaterialStateProperty.all(15),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      side: BorderSide(
                                        color: _hasColorBeenPressed2
                                            ? heretheme.getColor(
                                                themetype: 1, type: 'TextColor')
                                            : Colors.transparent,
                                      )))),
                      onPressed: () {
                        setState(() {
                          _hasColorBeenPressed1 = false;
                          _hasColorBeenPressed6 = false;
                          _hasColorBeenPressed3 = false;
                          _hasColorBeenPressed4 = false;
                          _hasColorBeenPressed5 = false;
                          _hasColorBeenPressed2 = true;
                          Provider.of<ThemeHandler>(context, listen: false)
                              .changetheme = Themes.light;
                        });
                      },
                      child: Container(
                        child: Text(' Light ',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize:
                                        (MediaQuery.of(context).size.height) /
                                            67,
                                    fontWeight: FontWeight.bold))),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextButton(
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                            EdgeInsets.all(50),
                          ),
                          backgroundColor: MaterialStateProperty.all(
                            heretheme.getColor(
                                themetype: 2, type: 'BackgroundColor'),
                          ),
                          overlayColor:
                              MaterialStateProperty.all(Colors.transparent),
                          elevation: MaterialStateProperty.all(15),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      side: BorderSide(
                                        color: _hasColorBeenPressed3
                                            ? heretheme.getColor(
                                                themetype: 2, type: 'TextColor')
                                            : Colors.transparent,
                                      )))),
                      onPressed: () {
                        setState(() {
                          _hasColorBeenPressed1 = false;
                          _hasColorBeenPressed2 = false;
                          _hasColorBeenPressed6 = false;
                          _hasColorBeenPressed4 = false;
                          _hasColorBeenPressed5 = false;
                          _hasColorBeenPressed3 = true;
                          Provider.of<ThemeHandler>(context, listen: false)
                              .changetheme = Themes.purple;
                        });
                      },
                      child: Container(
                        child: Text('  Purple  ',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize:
                                        (MediaQuery.of(context).size.height) /
                                            67,
                                    fontWeight: FontWeight.bold))),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    TextButton(
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                              EdgeInsets.fromLTRB(38, 50, 38, 50)),
                          backgroundColor: MaterialStateProperty.all(
                            heretheme.getColor(
                                themetype: 3, type: 'BackgroundColor'),
                          ),
                          overlayColor:
                              MaterialStateProperty.all(Colors.transparent),
                          elevation: MaterialStateProperty.all(15),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      side: BorderSide(
                                        color: _hasColorBeenPressed4
                                            ? heretheme.getColor(
                                                themetype: 3, type: 'TextColor')
                                            : Colors.transparent,
                                      )))),
                      onPressed: () {
                        setState(() {
                          _hasColorBeenPressed1 = false;
                          _hasColorBeenPressed2 = false;
                          _hasColorBeenPressed3 = false;
                          _hasColorBeenPressed6 = false;
                          _hasColorBeenPressed5 = false;
                          _hasColorBeenPressed4 = true;
                          Provider.of<ThemeHandler>(context, listen: false)
                              .changetheme = Themes.navyblue;
                        });
                      },
                      child: Container(
                        child: Text('NavyBlue',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize:
                                        (MediaQuery.of(context).size.height) /
                                            67,
                                    fontWeight: FontWeight.bold))),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextButton(
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                            EdgeInsets.all(50),
                          ),
                          backgroundColor: MaterialStateProperty.all(
                            heretheme.getColor(
                                themetype: 4, type: 'BackgroundColor'),
                          ),
                          overlayColor:
                              MaterialStateProperty.all(Colors.transparent),
                          elevation: MaterialStateProperty.all(15),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      side: BorderSide(
                                        color: _hasColorBeenPressed5
                                            ? heretheme.getColor(
                                                themetype: 4, type: 'TextColor')
                                            : Colors.transparent,
                                      )))),
                      onPressed: () {
                        setState(() {
                          _hasColorBeenPressed1 = false;
                          _hasColorBeenPressed2 = false;
                          _hasColorBeenPressed3 = false;
                          _hasColorBeenPressed6 = false;
                          _hasColorBeenPressed4 = false;
                          _hasColorBeenPressed5 = true;
                          Provider.of<ThemeHandler>(context, listen: false)
                              .changetheme = Themes.green;
                        });
                      },
                      child: Container(
                        child: Text('Green',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize:
                                        (MediaQuery.of(context).size.height) /
                                            67,
                                    fontWeight: FontWeight.bold))),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextButton(
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                            EdgeInsets.all(50),
                          ),
                          backgroundColor: MaterialStateProperty.all(
                            heretheme.getColor(
                                themetype: 5, type: 'BackgroundColor'),
                          ),
                          overlayColor:
                              MaterialStateProperty.all(Colors.transparent),
                          elevation: MaterialStateProperty.all(15),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      side: BorderSide(
                                        color: _hasColorBeenPressed6
                                            ? heretheme.getColor(
                                                themetype: 5, type: 'TextColor')
                                            : Colors.transparent,
                                      )))),
                      onPressed: () {
                        setState(() {
                          _hasColorBeenPressed1 = false;
                          _hasColorBeenPressed2 = false;
                          _hasColorBeenPressed3 = false;
                          _hasColorBeenPressed4 = false;
                          _hasColorBeenPressed5 = false;
                          _hasColorBeenPressed6 = true;
                          Provider.of<ThemeHandler>(context, listen: false)
                              .changetheme = Themes.teal;
                        });
                      },
                      child: Container(
                        child: Text('  Teal  ',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize:
                                        (MediaQuery.of(context).size.height) /
                                            67,
                                    fontWeight: FontWeight.bold))),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          decoration: PageDecoration(
            bodyAlignment: Alignment.center,
            titleTextStyle: Mytextstyle(),
            bodyTextStyle: bodyStyle,
            bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
            pageColor: returnbackgroundcolor(context: context),
            imagePadding: EdgeInsets.zero,
          ),
        ),
        PageViewModel(
          title: AppLocalizations.of(context)!.pattern,
          bodyWidget: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        TextButton(
                          style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                EdgeInsets.all(50),
                              ),
                              backgroundColor: MaterialStateProperty.all(
                                _hasanimatedBeenPressed
                                    ? returnbuttoncolor(context: context)
                                    : returnsplashcolor(context: context),
                              ),
                              overlayColor:
                                  MaterialStateProperty.all(Colors.transparent),
                              elevation: MaterialStateProperty.all(15),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      side: BorderSide(
                                        color: _hasanimatedBeenPressed
                                            ? returntextcolor(context: context)
                                            : returnsplashcolor(
                                                context: context),
                                      )))),
                          onPressed: () {
                            setState(() {
                              _hasanimatedBeenPressed = true;
                              _hasanimatedBeenPressed1 = false;
                              _hasanimatedBeenPressed2 = false;
                              _hasanimatedBeenPressed3 = false;
                              _hasanimatedBeenPressed4 = false;
                              Provider.of<AnimatedHandler>(context,
                                      listen: false)
                                  .changeanimation = 0;
                            });
                          },
                          child: Container(
                            width: double.infinity,
                            child: Text(
                              'Stars',
                              textAlign: TextAlign.center,
                              style: _hasanimatedBeenPressed
                                  ? Mytextstyle3()
                                  : Mytextstyle2(),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextButton(
                          style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                EdgeInsets.all(50),
                              ),
                              backgroundColor: MaterialStateProperty.all(
                                _hasanimatedBeenPressed1
                                    ? returnbuttoncolor(context: context)
                                    : returnsplashcolor(context: context),
                              ),
                              overlayColor:
                                  MaterialStateProperty.all(Colors.transparent),
                              elevation: MaterialStateProperty.all(15),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      side: BorderSide(
                                        color: _hasanimatedBeenPressed1
                                            ? returntextcolor(context: context)
                                            : returnsplashcolor(
                                                context: context),
                                      )))),
                          onPressed: () {
                            setState(() {
                              _hasanimatedBeenPressed = false;
                              _hasanimatedBeenPressed1 = true;
                              _hasanimatedBeenPressed2 = false;
                              _hasanimatedBeenPressed3 = false;
                              _hasanimatedBeenPressed4 = false;
                              Provider.of<AnimatedHandler>(context,
                                      listen: false)
                                  .changeanimation = 1;
                            });
                          },
                          child: Container(
                            width: double.infinity,
                            child: Text(
                              'Race',
                              textAlign: TextAlign.center,
                              style: _hasanimatedBeenPressed1
                                  ? Mytextstyle3()
                                  : Mytextstyle2(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        TextButton(
                          style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                EdgeInsets.all(50),
                              ),
                              backgroundColor: MaterialStateProperty.all(
                                _hasanimatedBeenPressed2
                                    ? returnbuttoncolor(context: context)
                                    : returnsplashcolor(context: context),
                              ),
                              overlayColor:
                                  MaterialStateProperty.all(Colors.transparent),
                              elevation: MaterialStateProperty.all(15),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      side: BorderSide(
                                        color: _hasanimatedBeenPressed2
                                            ? returntextcolor(context: context)
                                            : returnsplashcolor(
                                                context: context),
                                      )))),
                          onPressed: () {
                            setState(() {
                              _hasanimatedBeenPressed = false;
                              _hasanimatedBeenPressed1 = false;
                              _hasanimatedBeenPressed2 = true;
                              _hasanimatedBeenPressed3 = false;
                              _hasanimatedBeenPressed4 = false;
                              Provider.of<AnimatedHandler>(context,
                                      listen: false)
                                  .changeanimation = 2;
                            });
                          },
                          child: Container(
                            width: double.infinity,
                            child: Text(
                              'Bubbles',
                              textAlign: TextAlign.center,
                              style: _hasanimatedBeenPressed2
                                  ? Mytextstyle3()
                                  : Mytextstyle2(),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextButton(
                          style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                EdgeInsets.all(50),
                              ),
                              backgroundColor: MaterialStateProperty.all(
                                _hasanimatedBeenPressed3
                                    ? returnbuttoncolor(context: context)
                                    : returnsplashcolor(context: context),
                              ),
                              overlayColor:
                                  MaterialStateProperty.all(Colors.transparent),
                              elevation: MaterialStateProperty.all(15),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      side: BorderSide(
                                        color: _hasanimatedBeenPressed3
                                            ? returntextcolor(context: context)
                                            : returnsplashcolor(
                                                context: context),
                                      )))),
                          onPressed: () {
                            setState(() {
                              _hasanimatedBeenPressed = false;
                              _hasanimatedBeenPressed1 = false;
                              _hasanimatedBeenPressed2 = false;
                              _hasanimatedBeenPressed3 = true;
                              _hasanimatedBeenPressed4 = false;
                              Provider.of<AnimatedHandler>(context,
                                      listen: false)
                                  .changeanimation = 3;
                            });
                          },
                          child: Container(
                            width: double.infinity,
                            child: Text(
                              'Space',
                              textAlign: TextAlign.center,
                              style: _hasanimatedBeenPressed3
                                  ? Mytextstyle3()
                                  : Mytextstyle2(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              TextButton(
                style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                      EdgeInsets.all(50),
                    ),
                    backgroundColor: MaterialStateProperty.all(
                      _hasanimatedBeenPressed4
                          ? returnbuttoncolor(context: context)
                          : returnsplashcolor(context: context),
                    ),
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                    elevation: MaterialStateProperty.all(15),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            side: BorderSide(
                              color: _hasanimatedBeenPressed4
                                  ? returntextcolor(context: context)
                                  : returnsplashcolor(context: context),
                            )))),
                onPressed: () {
                  setState(() {
                    _hasanimatedBeenPressed = false;
                    _hasanimatedBeenPressed1 = false;
                    _hasanimatedBeenPressed2 = false;
                    _hasanimatedBeenPressed3 = false;
                    _hasanimatedBeenPressed4 = true;
                    Provider.of<AnimatedHandler>(context, listen: false)
                        .changeanimation = 4;
                  });
                },
                child: Container(
                  width: double.infinity,
                  child: Text(
                    'None',
                    textAlign: TextAlign.center,
                    style: _hasanimatedBeenPressed4
                        ? Mytextstyle3()
                        : Mytextstyle2(),
                  ),
                ),
              ),
            ],
          ),
          image: AnimatedBackground(
            vsync: this,
            behaviour: returnanimationbehavior(context: context),
            child: SizedBox(),
          ),
          decoration: PageDecoration(
              bodyAlignment: Alignment.center,
              fullScreen: true,
              titleTextStyle: Mytextstyle(),
              bodyTextStyle: bodyStyle,
              bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
              pageColor: returnbackgroundcolor(context: context),
              imagePadding: EdgeInsets.zero,
              bodyFlex: 4),
        ),
      ],
      onDone: () {
        _onIntroEnd(context);
      },
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: false,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: true,
      //rtl: true, // Display as right-to-left
      back: Icon(
        Icons.arrow_back,
        color: returniconcolor(context: context),
      ),
      skip: Text('Skip',
          style: TextStyle(
              fontWeight: FontWeight.w600,
              color: returntextcolor(context: context))),
      next: Icon(
        Icons.arrow_forward,
        color: returniconcolor(context: context),
      ),
      done: Text('Done',
          style: TextStyle(
              fontWeight: FontWeight.w600,
              color: returntextcolor(context: context))),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: DotsDecorator(
        size: Size(10.0, 10.0),
        color: returnbackgroundcolor(context: context),
        activeSize: Size(22.0, 10.0),
        activeColor: returnsplashcolor(context: context),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: ShapeDecoration(
        color: returnbuttoncolor(context: context),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}
