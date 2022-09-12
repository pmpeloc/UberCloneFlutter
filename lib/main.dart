import 'package:flutter/material.dart';
import 'package:uber_clone_flutter/pages/home/home_page.dart';

void main() {
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
        fontFamily: 'NimbusSans'
      ),
      routes: {
        'home': (BuildContext context) => HomePage(),
      },
    );
  }
}
