import 'package:animated_background/animated_background.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:kalnirnay_test/Themes/themesbrain.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../Generators/ad_helper.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:kalnirnay_test/l10n/l10n.dart';
import 'package:ntp/ntp.dart';
import 'package:http/http.dart' as http;
import 'package:convert/convert.dart' as convert;
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:intl/intl.dart';
import 'package:date_format/date_format.dart';


class fireinfo extends StatefulWidget {
  int imagenumberthis = 0;
  String nameee = '';
  fireinfo({Key? key, required this.imagenumberthis, required this.nameee})
      : super(key: key);

  @override
  State<fireinfo> createState() => _fireinfoState();
}

class _fireinfoState extends State<fireinfo> with TickerProviderStateMixin {
  String whichh = 'Taurus';

  // final firestoreInstance = FirebaseFirestore.instance;
  // String valuedaily = '';

  int _selectedIndex = 0;
  String selectedtype = "daily";

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

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 0) {
        selectedtype = AppLocalizations.of(context)!.daily;
      } else if (index == 2) {
        selectedtype = AppLocalizations.of(context)!.weekly;
      } else {
        selectedtype = AppLocalizations.of(context)!.monthly;
      }
    });
  }

  void _slideCarousel(int index) {
    setState(() {
      _selectedIndex = index;
      _selectedIndex += 1;
    });
  }

  void tellmewhich(int num) {
    if (widget.imagenumberthis == 1) {
      whichh = 'Taurus';
    } else if (widget.imagenumberthis == 2) {
      whichh = 'Aries';
    } else if (widget.imagenumberthis == 3) {
      whichh = 'Gemnini';
    } else if (widget.imagenumberthis == 4) {
      whichh = 'Cancer';
    } else if (widget.imagenumberthis == 5) {
      whichh = 'Leo';
    } else if (widget.imagenumberthis == 6) {
      whichh = 'Virgo';
    } else if (widget.imagenumberthis == 7) {
      whichh = 'Libra';
    } else if (widget.imagenumberthis == 8) {
      whichh = 'Scorpio';
    } else if (widget.imagenumberthis == 9) {
      whichh = 'Sagittarius';
    } else if (widget.imagenumberthis == 10) {
      whichh = 'Capricon';
    } else if (widget.imagenumberthis == 11) {
      whichh = 'Aquarius';
    } else {
      whichh = 'Pisces';
    }
  }

  // Current Date code
  var todaysDate = new Map();
  var previousDate = new Map();
  String current_week="";

  Future<void> getDate() async {
  DateTime _myTime;
  DateTime _ntpTime;

  /// Or you could get NTP current (It will call DateTime.now() and add NTP offset to it)
  _myTime = await NTP.now();

  /// Or get NTP offset (in milliseconds) and add it yourself
  final int offset = await NTP.getNtpOffset(localTime: DateTime.now());
  _ntpTime = _myTime.add(Duration(milliseconds: offset));

  print('My time: $_myTime');
  print('NTP time: $_ntpTime');
  print('Difference: ${_myTime.difference(_ntpTime).inMilliseconds}ms');
  todaysDate["month"] = _myTime.month.toString();
  todaysDate["date"] = _myTime.day.toString();
  todaysDate["year"] = _myTime.year.toString();

  if(todaysDate["date"].length==1)
  {
    String temp="0"+todaysDate["date"];
    todaysDate["date"]=temp;
  }
  if(todaysDate["month"].length==1)
  {
    String temp="0"+todaysDate["month"];
    todaysDate["month"]=temp;
  }


  DateTime today = DateTime.parse(_myTime.toString());
  List months = ['jan', 'feb', 'mar', 'apr', 'may','jun','jul','aug','sep','oct','nov','dec'];
  for(int i=1;i<8;i++)
  {
    Map tempMap = new Map();
    DateTime temp = today.subtract(Duration(days:i));

    // Month
    String current_month = temp.month.toString();
    if(current_month.length==1)
      current_month = '0'+current_month;
    tempMap["month"] = current_month;
    
    // Year
    String current_year = temp.year.toString();
    // Date
    String current_date = temp.day.toString();

    tempMap["date"]=current_date;
    tempMap["month"]=current_month;
    tempMap["year"]=current_year;
    previousDate[i.toString()] = tempMap;
  }

  // Calculate Weeks
  DateTime from = DateTime.utc(int.parse(todaysDate["year"]), 1, 1);
  DateTime to = DateTime.utc(int.parse(todaysDate["year"]), int.parse(todaysDate["month"]), int.parse(todaysDate["date"]));
  // DateTime to = DateTime.utc(2023, 1, 7);
  int weeks=((to.difference(from).inDays+1) / 7).ceil();

  current_week = weeks.toString();
  if(current_week.length==1)
    current_week = '0'+weeks.toString();
  }


  @override
  // void initState() {
  //   super.initState();
  //   firestoreInstance.collection("daily").snapshots().listen((result) {
  //     result.docs.forEach((result) {
  //       print(result.data());
  //     });
  //   });
  // }
  void initState() {
    initializemyads();
    super.initState();
    tellmewhich(widget.imagenumberthis);
    getDate();
  }

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
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios_rounded,
                  color: returniconcolor(context: context))),
          iconTheme: IconThemeData(color: returniconcolor(context: context)),
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(widget.nameee,
                textAlign: TextAlign.center,
                style: returntitletextstyle(context: context)),
          ),
        ),
        // bottomNavigationBar: BottomNavigationBar(
        //   items: <BottomNavigationBarItem>[
        //     BottomNavigationBarItem(
        //       icon: Icon(FontAwesomeIcons.calendarDay),
        //       label: AppLocalizations.of(context)!.daily,
        //       backgroundColor: returnbackgroundcolor(context: context),
        //     ),
        //     BottomNavigationBarItem(
        //         icon: Icon(FontAwesomeIcons.calendarWeek),
        //         label: AppLocalizations.of(context)!.weekly,
        //         backgroundColor: returnsplashcolor(context: context)),
        //     BottomNavigationBarItem(
        //         icon: Icon(
        //           FontAwesomeIcons.calendarDays,
        //         ),
        //         label: AppLocalizations.of(context)!.monthly,
        //         backgroundColor: returnbackgroundcolor(context: context)),
        //   ],
        //   currentIndex: _selectedIndex,
        //   backgroundColor: returnbuttoncolor(context: context),
        //   selectedItemColor: returntextcolor(context: context),
        //   onTap: _onItemTapped,
        // ),

        backgroundColor: returnbackgroundcolor(context: context),
        body: SafeArea(
          child: AnimatedBackground(
            behaviour: RandomParticleBehaviour(
              options: ParticleOptions(
                image: Image.asset('images/icon${widget.imagenumberthis}.png'),
                baseColor: Colors.blue,
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
            vsync: this,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Hero(
                      transitionOnUserGestures: true,
                      tag: '${widget.imagenumberthis}',
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: (MediaQuery.of(context).size.height) / 20,
                        child: Image(
                          image: AssetImage(
                              'images/icon${widget.imagenumberthis}.png'),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: StreamBuilder(
                      stream: FirebaseDatabase.instance.ref('horoscope').onValue,
                    
                      builder: (context,
                          AsyncSnapshot<DatabaseEvent> snap) {
                        // if (snapshot.hasError) {
                        //   return Text('Something went wrong',
                        //       style: returndefaulttextstyle(context: context));
                        // }
                        if (!snap.hasData || todaysDate.isEmpty || previousDate.isEmpty || current_week=="") {
                          return Text("Loading",
                              style: returndefaulttextstyle(context: context));
                        }
                        else{
                        Map<dynamic, dynamic> map = snap.data!.snapshot.value as dynamic;
                          List<dynamic> list = [];
                          list.clear();
                          list = map.values.toList();
                          return ListView(
                            children : [CarouselSlider(
                                  items: [
                                    Column(
                                      children: [
                                        Container(
                                          child: Text(
                                              previousDate["7"]["date"]+"-"+previousDate["7"]["month"]+"-"+previousDate["7"]["year"],
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20)),
                                        ),
                                        Expanded(
                                          child: SingleChildScrollView(
                                              child: Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                10, 10, 10, 10),
                                            child: Text(list[0][previousDate["7"]["year"]]==null || list[0][previousDate["7"]["year"]][previousDate["7"]["month"]]==null || list[0][previousDate["7"]["year"]][previousDate["7"]["month"]][previousDate["7"]["date"]]==null || list[0][previousDate["7"]["year"]][previousDate["7"]["month"]][previousDate["7"]["date"]][whichh.toLowerCase()]==null
                                              ? "No Data": list[0][previousDate["7"]["year"]][previousDate["7"]["month"]][previousDate["7"]["date"]][whichh.toLowerCase()].toString(),
                                                textAlign: TextAlign.justify,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 17)),
                                          )),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          child: Text(
                                              previousDate["6"]["date"]+"-"+previousDate["6"]["month"]+"-"+previousDate["6"]["year"],
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20)),
                                        ),
                                        Expanded(
                                          child: SingleChildScrollView(
                                              child: Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                10, 10, 10, 10),
                                            child: Text(list[0][previousDate["6"]["year"]]==null || list[0][previousDate["6"]["year"]][previousDate["6"]["month"]]==null || list[0][previousDate["6"]["year"]][previousDate["6"]["month"]][previousDate["6"]["date"]]==null || list[0][previousDate["6"]["year"]][previousDate["6"]["month"]][previousDate["6"]["date"]][whichh.toLowerCase()]==null
                                              ? "No Data": list[0][previousDate["6"]["year"]][previousDate["6"]["month"]][previousDate["6"]["date"]][whichh.toLowerCase()].toString(),
                                                textAlign: TextAlign.justify,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 17)),
                                          )),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          child: Text(
                                              previousDate["5"]["date"]+"-"+previousDate["5"]["month"]+"-"+previousDate["5"]["year"],
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20)),
                                        ),
                                        Expanded(
                                          child: SingleChildScrollView(
                                              child: Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                10, 10, 10, 10),
                                            child: Text(list[0][previousDate["5"]["year"]]==null || list[0][previousDate["5"]["year"]][previousDate["5"]["month"]]==null || list[0][previousDate["5"]["year"]][previousDate["5"]["month"]][previousDate["5"]["date"]]==null || list[0][previousDate["5"]["year"]][previousDate["5"]["month"]][previousDate["5"]["date"]][whichh.toLowerCase()]==null
                                              ? "No Data": list[0][previousDate["5"]["year"]][previousDate["5"]["month"]][previousDate["5"]["date"]][whichh.toLowerCase()].toString(),
                                                textAlign: TextAlign.justify,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 17)),
                                          )),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          child: Text(
                                              previousDate["4"]["date"]+"-"+previousDate["4"]["month"]+"-"+previousDate["4"]["year"],
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20)),
                                        ),
                                        Expanded(
                                          child: SingleChildScrollView(
                                              child: Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                10, 10, 10, 10),
                                            child: Text(list[0][previousDate["4"]["year"]]==null || list[0][previousDate["4"]["year"]][previousDate["4"]["month"]]==null || list[0][previousDate["4"]["year"]][previousDate["4"]["month"]][previousDate["4"]["date"]]==null || list[0][previousDate["4"]["year"]][previousDate["4"]["month"]][previousDate["4"]["date"]][whichh.toLowerCase()]==null
                                              ? "No Data": list[0][previousDate["4"]["year"]][previousDate["4"]["month"]][previousDate["4"]["date"]][whichh.toLowerCase()].toString(),
                                                textAlign: TextAlign.justify,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 17)),
                                          )),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          child: Text(
                                              previousDate["3"]["date"]+"-"+previousDate["3"]["month"]+"-"+previousDate["3"]["year"],
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20)),
                                        ),
                                        Expanded(
                                          child: SingleChildScrollView(
                                              child: Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                10, 10, 10, 10),
                                            child: Text(list[0][previousDate["3"]["year"]]==null || list[0][previousDate["3"]["year"]][previousDate["3"]["month"]]==null || list[0][previousDate["3"]["year"]][previousDate["3"]["month"]][previousDate["3"]["date"]]==null || list[0][previousDate["3"]["year"]][previousDate["3"]["month"]][previousDate["3"]["date"]][whichh.toLowerCase()]==null
                                              ? "No Data": list[0][previousDate["3"]["year"]][previousDate["3"]["month"]][previousDate["3"]["date"]][whichh.toLowerCase()].toString(),
                                                textAlign: TextAlign.justify,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 17)),
                                          )),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        
                                        Container(
                                          child: Text(
                                              previousDate["2"]["date"]+"-"+previousDate["2"]["month"]+"-"+previousDate["2"]["year"],
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20)),
                                        ),
                                        Expanded(
                                          child: SingleChildScrollView(
                                              child: Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                10, 10, 10, 10),
                                            child: Text(list[0][previousDate["2"]["year"]]==null || list[0][previousDate["2"]["year"]][previousDate["2"]["month"]]==null || list[0][previousDate["2"]["year"]][previousDate["2"]["month"]][previousDate["2"]["date"]]==null || list[0][previousDate["2"]["year"]][previousDate["2"]["month"]][previousDate["2"]["date"]][whichh.toLowerCase()]==null
                                              ? "No Data": list[0][previousDate["2"]["year"]][previousDate["2"]["month"]][previousDate["2"]["date"]][whichh.toLowerCase()].toString(),
                                                textAlign: TextAlign.justify,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 17)),
                                          )),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          child: Text(previousDate["1"]["date"]+"-"+previousDate["1"]["month"]+"-"+previousDate["1"]["year"],
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20)),
                                        ),
                                        Expanded(
                                          child: SingleChildScrollView(
                                              child: Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                10, 10, 10, 10),
                                            child: Text(list[0][previousDate["1"]["year"]]==null || list[0][previousDate["1"]["year"]][previousDate["1"]["month"]]==null || list[0][previousDate["1"]["year"]][previousDate["1"]["month"]][previousDate["1"]["date"]]==null || list[0][previousDate["1"]["year"]][previousDate["1"]["month"]][previousDate["1"]["date"]][whichh.toLowerCase()]==null
                                              ? "No Data": list[0][previousDate["1"]["year"]][previousDate["1"]["month"]][previousDate["1"]["date"]][whichh.toLowerCase()].toString(),
                                                textAlign: TextAlign.justify,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 17)),
                                          )),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          child: Text(
                                              "Daily",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20)),
                                        ),
                                        Expanded(
                                          child: SingleChildScrollView(
                                              child: Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                10, 10, 10, 10),
                                            child: Text(list[0][todaysDate["year"]]==null || list[0][todaysDate["year"]][todaysDate["month"]]==null || list[0][todaysDate["year"]][todaysDate["month"]][todaysDate["date"]]==null || list[0][todaysDate["year"]][todaysDate["month"]][todaysDate["date"]][whichh.toLowerCase()]==null ? 
                                            "No Date" : list[0][todaysDate["year"]][todaysDate["month"]][todaysDate["date"]][whichh.toLowerCase()].toString(),
                                                textAlign: TextAlign.justify,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 17)),
                                          )),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          child: Text("Weekly",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20)),
                                        ),
                                        Expanded(
                                          child: SingleChildScrollView(
                                              child: Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                10, 10, 10, 10),
                                            child: Text(list[2][todaysDate["year"]]==null || list[2][todaysDate["year"]][current_week]==null || list[2][todaysDate["year"]
                                            ][current_week][whichh.toLowerCase()]==null ? 
                                            "No Data to Show" : list[2][todaysDate["year"]][current_week][whichh.toLowerCase()].toString(),
                                                textAlign: TextAlign.justify,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 17)),
                                          )),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          child: Text("Monthly",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20)),
                                        ),
                                        Expanded(
                                          child: SingleChildScrollView(
                                              child: Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                10, 10, 10, 10),
                                            child: Text(list[1][todaysDate["year"]]==null || list[1][todaysDate["year"]][todaysDate["month"]]==null || list[1][todaysDate["year"]][todaysDate["month"]][whichh.toLowerCase()]==null ? "No Data" :
                                            list[1][todaysDate["year"]][todaysDate["month"]][whichh.toLowerCase()].toString(),
                                                textAlign: TextAlign.justify,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 17)),
                                          )),
                                        ),
                                      ],
                                    ),
                                  ],
                                  options: CarouselOptions(
                                    height: MediaQuery.of(context).size.height -
                                        300,
                                    enlargeCenterPage: true,
                                    // autoPlay: true,
                                    initialPage: 7,
                                    aspectRatio: 16 / 9,
                                    autoPlayCurve: Curves.fastOutSlowIn,
                                    enableInfiniteScroll: false,
                                    autoPlayAnimationDuration:
                                        Duration(milliseconds: 800),
                                    viewportFraction: 1,
                                    // onPageChanged: (index, reason) {
                                    //   _selectedIndex = index;
                                    //   setState((){_selectedIndex+=1;});
                                    // }
                                  ),
                                )
                            ],
                          );
                        }
                          

                          //     children: [
                          //       CarouselSlider(
                          //         items: [
                          //           Container(
                          //             height: 200,
                          //             width: 400,
                          //             color: Colors.yellowAccent,
                          //           ),
                          //           Container(
                          //             height: 200,
                          //             width: 400,
                          //             color: Colors.red,
                          //           ),
                          //           Container(
                          //             height: 200,
                          //             width: 400,
                          //             color: Colors.blue,
                          //           ),
                          //         ],

                          //     options: CarouselOptions(
                          //       height: 180.0,
                          //       enlargeCenterPage: true,
                          //       // autoPlay: true,
                          //       aspectRatio: 16/9,
                          //       autoPlayCurve: Curves.fastOutSlowIn,
                          //       enableInfiniteScroll: false,
                          //       autoPlayAnimationDuration: Duration(milliseconds: 800),
                          //       viewportFraction: 1,
                          //     ),
                          //   ),
                          // ],
                        // );
                      },
                    ),
                  ),
                  returnad(),
                  // Align(
                  //   alignment: Alignment.bottomCenter,
                  //   child: Row(
                  //     children: [
                  //       Icon(Icons.font_download_outlined,
                  //           size: (MediaQuery.of(context).size.height) / 35,
                  //           color: returniconcolor(context: context)),
                  //       Expanded(
                  //         child: Slider(
                  //           activeColor: returnsplashcolor(context: context),
                  //           inactiveColor: returnbuttoncolor(context: context),
                  //           thumbColor: returntextcolor(context: context),
                  //           label: Provider.of<SizeSliderHandler>(context)
                  //               .returnsize
                  //               .toString(),
                  //           divisions: 10,
                  //           value: Provider.of<SizeSliderHandler>(context)
                  //               .returnsize,
                  //           onChanged: (value) {
                  //             Provider.of<SizeSliderHandler>(context,
                  //                     listen: false)
                  //                 .changenumber = value;
                  //           },
                  //           min: 15,
                  //           max: 35,
                  //         ),
                  //       ),
                  //       Icon(Icons.font_download_outlined,
                  //           size: (MediaQuery.of(context).size.height) / 22,
                  //           color: returniconcolor(context: context)),
                  //     ],
                  //   ),
                  // )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// TextButton(
// //     onPressed: () {
// //       // firestoreInstance
// //       //     .collection("daily")
// //       //     .doc('dVnkbjlBs47R9W35LYaw')
// //       //     .get()
// //       //     .then((value) {
// //       //   print(value.data()!['today']);
// //       // });
// //       // firestoreInstance
// //       //     .collection("daily")
// //       //     .snapshots()
// //       //     .listen((result) {
// //       //   result.docs.forEach((result) {
// //       //     print(result.data());
// //       //   });
// //       // });
// //     },
// //     child: Text('Press me'))

  //       valuedaily = result.data()['today'];
  