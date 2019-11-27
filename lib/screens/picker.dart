import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Picker extends StatelessWidget {
  Picker({this.list});

  final List<String> list;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      height: 100,
      width: 100,
      child: CupertinoPicker(
        backgroundColor: Colors.blue[300],
        magnification: 0.9,
        useMagnifier: true,
        children: <Widget>[
          for (var item in this.list)
            Text(
              item,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            )
        ],
        itemExtent: 25,
        looping: true,
        onSelectedItemChanged: (int value) {
          print(value);
        },
      ),
    );
  }
}
