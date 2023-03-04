import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kalnirnay_test/Generators/calculatorhandler.dart';
import 'package:kalnirnay_test/Generators/languageprovider.dart';
import 'package:kalnirnay_test/Generators/slidercontrol.dart';
import 'package:kalnirnay_test/Screens/introduction.dart';
import 'package:kalnirnay_test/Themes/animationhandler.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:kalnirnay_test/Screens/home.dart';
import 'package:kalnirnay_test/Themes/themes.dart';
import 'package:kalnirnay_test/Themes/themehandler.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:kalnirnay_test/l10n/l10n.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:kalnirnay_test/Generators/languageprovider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:math' as math;
import 'package:page_transition/src/enum.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();
  // if (kDebugMode) {
  //   print("Handling a background message: ${message.messageId}");
  // }
  // if (kDebugMode) {
  //   print(message.data.toString());
  // }
}

// FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//   if (kDebugMode) {
//     print('Got a message whilst in the foreground!');
//   }
//   sendNotification(title: 'This is a test', body: 'Got!');
//   if (kDebugMode) {
//     print('Message data: ${message.data}');
//   }
//
//   if (message.notification != null) {
//     if (kDebugMode) {
//       print('Message also contained a notification: ${message.notification}');
//     }
//   }
// });
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      // // Todo: If App is to be on web uncomment the below
      /* options: const FirebaseOptions(
         apiKey: "XXX",
         appId: "XXX",
         messagingSenderId: "XXX",
         projectId: "XXX",
       ),*/
      );
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  final prefs = await SharedPreferences.getInstance();
  bool introdone = false;
  if (prefs.getBool('introdonecheck') == null) {
    introdone = false;
  } else {
    introdone = prefs.getBool('introdonecheck')!;
  }
  final ThemeHandler ThisTheme8 = ThemeHandler(prefs);

  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeHandler>(
            create: (context) => ThemeHandler(prefs)),
        ChangeNotifierProvider<SizeSliderHandler>(
            create: (context) => SizeSliderHandler(prefs)),
        ChangeNotifierProvider<AnimatedHandler>(
            create: (context) => AnimatedHandler(prefs)),
        ChangeNotifierProvider<LocaleProvider>(
            create: (context) => LocaleProvider(prefs)),
        ChangeNotifierProvider<CalciHandler>(
            create: (context) => CalciHandler()),
      ],
      child: splash(
        introdone: introdone,
      )));
}

class splash extends StatelessWidget {
  bool introdone = false;
  splash({Key? key, required this.introdone}) : super(key: key);
  Mytheme currenttheme = Mytheme();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
    );
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return MaterialApp(
      locale: Provider.of<LocaleProvider>(context, listen: true).locale,
      supportedLocales: l10n.all,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen.withScreenFunction(
          duration: 2430,
          splashIconSize: 1000,
          splash: _AnimatedWidgetExample(),
          splashTransition: SplashTransition.fadeTransition,
          pageTransitionType:PageTransitionType.fade,
          screenFunction: () async {
            if (introdone) {
              return centre();
            } else {
              return App();
            }
          },
          backgroundColor: Color.fromARGB(255, 47, 53, 151)),
    );
  }
}



  /// Transition enum
  enum PageTransitionsType {
  /// theme default
  theme,

  /// Fade Animation
  fade,

  /// Right to left animation
  rightToLeft,

  /// Left to right animation
  leftToRight,

  /// Top to bottom animation

  topToBottom,

  /// Bottom to top animation

  bottomToTop,

  /// Scale animation

  scale,

  /// Rotate animation

  rotate,

  /// Size animation

  size,

  /// Right to left with fading animation

  rightToLeftWithFade,

  /// Left to right with fading animation

  leftToRightWithFade,

  /// Left to right slide as if joined

  leftToRightJoined,

  /// Right to left slide as if joined

  rightToLeftJoined,

  /// Top to bottom as if joined

  topToBottomJoined,

  /// Bottom to top as if joined

  bottomToTopJoined,

  /// Pop the current screen left to right

  leftToRightPop,

  /// Pop the current screen right to left

  rightToLeftPop,

  /// Pop the current screen top to bottom

  topToBottomPop,

  /// Pop the current screen bottom to top

  bottomToTopPop,
  }



class _AnimatedWidgetExample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AnimatedWidgetExampleState();
}

class _AnimatedWidgetExampleState extends State<_AnimatedWidgetExample>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )..repeat();
    _animation = Tween(begin: 0.58, end: 0.98).animate(ReverseAnimation(
        CurvedAnimation(parent: _controller, curve: Curves.decelerate)));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 3, 31, 151),
      /*appBar: AppBar(
        title: Text('Flutter Demo'),
      ),*/
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'images/rashi.png',
            height: screenHeight * 0.1,
            width: screenWidth * 0.6,
          ),
          Center(
            child: Stack(
              children: [
                Center(
                  child: SizedBox(
                    height: screenHeight * 0.5,
                    width: screenWidth * 0.9,
                    child: AnimatedBuilder(
                      animation: _controller,
                      child: Image(
                        height: 340,
                        width: 340,
                        image: AssetImage('images/circular_zodiac.png'),
                      ),
                      builder: (BuildContext context, Widget? child) {
                        return Transform.rotate(
                          angle: _controller.value * 1.5 * math.pi,
                          child: child,
                        );
                      },
                    ),
                  ),
                ),
                Center(
                  child: SizedBox(
                    height: screenHeight * 0.5,
                    width: screenWidth * 0.9,
                    child: AnimatedBuilder(
                      animation: _controller,
                      child: Image(
                        height: 340,
                        width: 340,
                        image: AssetImage('images/kal_sun_white.png'),
                      ),
                      builder: (BuildContext context, Widget? child) {
                        return Transform.rotate(
                            angle: _controller.value * -2 * math.pi,
                            child: ScaleTransition(
                              scale: _animation,
                              child: child,
                            ));
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Image.asset(
            'images/kal.png',
            height: screenHeight * 0.1,
            width: screenWidth * 0.7,
          ),
        ],
      ),
    );
  }
}
