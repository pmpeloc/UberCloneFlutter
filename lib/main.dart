// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:uber_clone_flutter/src/pages/home/home_page.dart';
import 'package:uber_clone_flutter/src/pages/login/login_page.dart';
import 'package:uber_clone_flutter/src/utils/colors.dart' as utils;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Uber Clone',
      initialRoute: 'home',
      theme: ThemeData(
        fontFamily: 'NimbusSans',
        appBarTheme: AppBarTheme(
          elevation: 0
        ),
        primarySwatch: createThemeSwatch(utils.Colors.uberCloneColor),
        // primaryColor: src.utils.Colors.uberCloneColor,
      ),
      routes: {
        'home': (BuildContext context) => HomePage(),
        'login': (BuildContext context) => LoginPage(),
      },
    );
  }

  // create theme swatch
  MaterialColor createThemeSwatch(Color color) {
    List strengths = <double>[.05];
    Map<int, Color> swatch = {};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    strengths.forEach((strength) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    });
    return MaterialColor(color.value, swatch);
  }
}
