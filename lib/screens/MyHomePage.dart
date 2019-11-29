import 'dart:convert';
import 'package:currency/screens/components/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'bottomSheet.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key key,
  }) : super(key: key);

  static const String id = 'home';

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final String hint = "ENTER THE AMOUNT";
  double amount;

  List<String> list = kList;

  String base = "ALL";
  String convert = "ALL";
  String pair1 = "ALL_ALL";
  String pair2 = "ALL_ALL";
  double baseToConvert;
  double convertToBase;
  double resultx = 1.0;
  List<String> pickerList;

  void initState() {
    super.initState();

    getData();
  }

  Future getData() async {
    http.Response response = await http.get(
        'https://free.currconv.com/api/v7/convert?q=$pair1,$pair2&compact=ultra&apiKey=c519fcad4756d47954bd');
    String data = response.body;
    // var data1 = jsonDecode(data)['results'].keys;
    Map<String, dynamic> res = jsonDecode(data);
    print(response.body);
    setState(() {
      amount = 1.0;
      baseToConvert = res['$pair1'];
      convertToBase = res['$pair2'];

      resultx = baseToConvert * amount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, //or wrap with a singlechild scrol view
      appBar: AppBar(
        title: ListTile(
          title: Text(
            'CONVERTY',
            style: TextStyle(color: Colors.teal),
          ),
          subtitle: Text('THE CURRENCY CONVERTER'),
        ),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.blue[200],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CupertinoPicker(
                  backgroundColor: Colors.blue[200],
                  magnification: 1.5,
                  useMagnifier: true,
                  children: <Widget>[
                    for (var item in kcurrencies)
                      Text(
                        item,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      )
                  ],
                  itemExtent: 25,
                  looping: true,
                  onSelectedItemChanged: (int value) {
                    setState(() {
                      base = list[value];
                      print(base);
                    });
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.blue[200],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Icon(
                          Icons.label_important,
                          size: 100,
                          color: Colors.black,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          height: 100,
                          width: 200,
                          child: CupertinoPicker(
                            backgroundColor: Colors.blue[200],
                            magnification: 1.1,
                            useMagnifier: true,
                            children: <Widget>[
                              for (var item in kcurrencies)
                                Text(
                                  item,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                )
                            ],
                            itemExtent: 25,
                            looping: true,
                            onSelectedItemChanged: (int value) {
                              setState(() {
                                convert = list[value];
                                print(convert);
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(10),
                      // color: Colors.red,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.blue[400],
                      ),
                      child: Align(
                        alignment: Alignment(1.0, -0.25),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            setState(() {
                              amount = double.parse(value);
                            });
                            print(amount);
                          },
                          onEditingComplete: () {
                            FocusScope.of(context).unfocus();
                            setState(() {
                              pair1 = '${base}_$convert';
                              pair2 = '${convert}_$base';
                            });

                            if (base == null || convert == null) {
                              return;
                            } else {
                              getData();
                            }
                          },
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black45,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter the amount',
                            hintStyle: TextStyle(
                                color: Colors.black45,
                                fontWeight: FontWeight.bold,
                                fontSize: 25),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          new MyBottomSheet(
            result: double.parse(resultx.toStringAsFixed(3)),
            text1: base,
            text2: convert,
          )
        ],
      ),
    );
  }
}
