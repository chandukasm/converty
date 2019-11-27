import 'package:currency/screens/components/constants.dart';
import 'package:flutter/material.dart';

class CustomBox extends StatelessWidget {
  CustomBox({this.child});

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          width: double.infinity,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.blue[200],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              child,
            ],
          )),
    );
  }
}
