// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class CustomPicker extends StatelessWidget {
//   CustomPicker({
//     this.list,
//   });

//   final List<String> list;
//   void onSelectedItemChanged(int value) {

//   }
//   @override
//   Widget build(BuildContext context) {
//     return CupertinoPicker(
//       backgroundColor: Colors.blue[200],
//       magnification: 0.9,
//       useMagnifier: true,
//       children: <Widget>[
//         for (var item in list)
//           Text(
//             item,
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           )
//       ],
//       itemExtent: 25,
//       looping: true,
//       onSelectedItemChanged: onSelectedItemChanged(2){},
//     );
//   }
// }
