import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyBottomSheet extends StatelessWidget {
  MyBottomSheet({
    this.result,
    this.text1,
    this.text2,
  });

  final double result;
  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Center(
        child: Text(
          "CONVERT",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
      onPressed: () {
        print('base = $text1 & convert = $text2 ');
        showBottomSheet(
          context: context,
          builder: (context) => Container(
            height: 250,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.blue[300],
            ),
            child: Column(
              children: <Widget>[
                Center(
                  child: Text(
                    "The amount is:"
                    '$result',
                    style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: 50),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
