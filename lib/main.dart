import 'package:currency/screens/MyHomePage.dart';
import 'package:currency/screens/splash.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      // '/HomeScreen' : home: MyHomePage(title: 'Currency Converter'),
      // initialRoute: MyHomePage.id,
      initialRoute: '/',

      routes: {
        '/': (context) => MyHomePage(),
      },
    );
  }
}
