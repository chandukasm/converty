import 'dart:async';

import 'package:currency/screens/MyHomePage.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static const String id = 'string';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startime() async {
    var _duration = new Duration(seconds: 2);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    // Navigator.ozf(context).pushReplacementNamed(MyHomePage.id);
    Navigator.push(
      context,
      new MaterialPageRoute(
        builder: (context) => new MyHomePage(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    // startime();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/home');
      },
      child: Image.asset('assets/images/splash.jpg'),
    );
  }
}
