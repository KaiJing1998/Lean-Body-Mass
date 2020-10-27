import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double h,
      w,
      resultBoer = 0.0,
      resultJames = 0.0,
      resultHume = 0.0,
      resultChildren = 0.0,
      percentageBoer = 0.0,
      percentageJames = 0.0,
      percentageHume = 0.0,
      percentageChildren = 0.0,
      bodyFatBoer = 0.0,
      bodyFatJames = 0.0,
      bodyFatHume = 0.0,
      bodyFatChildren = 0.0;

  String lbs = "";
  int _radioGender = 0;
  int _radioAge = 0;
  TextEditingController _heightController = new TextEditingController();
  TextEditingController _weightController = new TextEditingController();

  void _handleRadioValueChange(int value) {
    setState(() {
      _radioGender = value;
    });
  }

  void _handleRadioValueChange1(int value) {
    setState(() {
      _radioAge = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal[900],
          title: Text('Lean Body Mass (Metric Unit)'),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(padding: EdgeInsets.fromLTRB(0, 5, 20, 0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Gender :',
                        style: new TextStyle(
                            fontSize: 23.0, fontWeight: FontWeight.bold),
                      ),
                      Radio(
                        value: 1,
                        groupValue: _radioGender,
                        onChanged: _handleRadioValueChange,
                      ),
                      Text('Male', style: new TextStyle(fontSize: 23.0)),
                      Radio(
                        value: 2,
                        groupValue: _radioGender,
                        onChanged: _handleRadioValueChange,
                      ),
                      Text('Female', style: new TextStyle(fontSize: 23.0)),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 50, 10),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text('Age 14 or younger ?',
                          style: new TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 23.0)),
                      Radio(
                        value: 3,
                        groupValue: _radioAge,
                        onChanged: _handleRadioValueChange1,
                      ),
                      Text('Yes', style: new TextStyle(fontSize: 23.0)),
                      Radio(
                        value: 4,
                        groupValue: _radioAge,
                        onChanged: _handleRadioValueChange1,
                      ),
                      Text('No', style: new TextStyle(fontSize: 23.0)),
                    ],
                  ),
                  //Divider(height: 15.0, color: Colors.black),
                  Padding(
                    padding: EdgeInsets.fromLTRB(50, 15, 50, 10),
                    child: TextField(
                      controller: _heightController,
                      keyboardType: TextInputType.number,
                      style: new TextStyle(
                          fontSize: 22.0,
                          color: Color(0xFF263238),
                          fontWeight: FontWeight.w200,
                          fontFamily: "serif"),
                      decoration: new InputDecoration(
                          border: new OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(10.0),
                            ),
                          ),
                          filled: true,
                          hintStyle: new TextStyle(color: Colors.grey[800]),
                          hintText: "Height (cm)",
                          fillColor: Colors.white70),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(50, 15, 50, 10),
                    child: TextField(
                      controller: _weightController,
                      keyboardType: TextInputType.number,
                      style: new TextStyle(
                          fontSize: 22.0,
                          color: Color(0xFF263238),
                          fontWeight: FontWeight.w200,
                          fontFamily: "serif"),
                      decoration: new InputDecoration(
                          border: new OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(10.0),
                            ),
                          ),
                          filled: true,
                          hintStyle: new TextStyle(color: Colors.grey[800]),
                          hintText: "Weight (kg)",
                          fillColor: Colors.white70),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 15, 0.0, 0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        new MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0))),
                          elevation: 5.0,
                          minWidth: 150.0,
                          height: 50,
                          color: Color(0xFF0A1B44),
                          child: new Text('CALCULATE',
                              style: new TextStyle(
                                  fontSize: 24.0, color: Colors.white)),
                          onPressed: _lbmOperation,
                        ),
                        new MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0))),
                          elevation: 5.0,
                          minWidth: 150.0,
                          height: 50,
                          color: Color(0xFF0A1B44),
                          child: new Text('CLEAR',
                              style: new TextStyle(
                                  fontSize: 24.0, color: Colors.white)),
                          onPressed: _resetOperation,
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 22, 0, 20),
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.all(1.5),
                          child: Table(
                            border: TableBorder.all(
                                color: Colors.black,
                                style: BorderStyle.solid,
                                width: 2.2),
                            children: [
                              TableRow(children: [
                                Text(
                                  "Formula",
                                  textScaleFactor: 1.7,
                                  textAlign: TextAlign.center,
                                  style: new TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Lean Body Mass",
                                  textScaleFactor: 1.7,
                                  textAlign: TextAlign.center,
                                  style: new TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Body Fat",
                                  textAlign: TextAlign.center,
                                  textScaleFactor: 1.7,
                                  style: new TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ]),
                              TableRow(children: [
                                Text(
                                  "Boer",
                                  textAlign: TextAlign.center,
                                  textScaleFactor: 1.6,
                                  style: new TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "${resultBoer.toStringAsFixed(1) + "kg" + "(" + percentageBoer.toStringAsFixed(0) + "%" + ")"}",
                                  //"${"(" + percentageBoer.toStringAsFixed(1) + ")"}",
                                  textScaleFactor: 1.5,
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  "${bodyFatBoer.toStringAsFixed(0) + "%"}",
                                  textScaleFactor: 1.5,
                                  textAlign: TextAlign.center,
                                ),
                              ]),
                              TableRow(children: [
                                Text(
                                  "James",
                                  textAlign: TextAlign.center,
                                  textScaleFactor: 1.6,
                                  style: new TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "${resultJames.toStringAsFixed(1) + "kg" + "(" + percentageJames.toStringAsFixed(0) + "%" + ")"}",
                                  textScaleFactor: 1.5,
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  "${bodyFatJames.toStringAsFixed(0) + "%"}",
                                  textScaleFactor: 1.5,
                                  textAlign: TextAlign.center,
                                ),
                              ]),
                              TableRow(children: [
                                Text(
                                  "Hume",
                                  textAlign: TextAlign.center,
                                  textScaleFactor: 1.6,
                                  style: new TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "${resultHume.toStringAsFixed(1) + "kg" + "(" + percentageHume.toStringAsFixed(0) + "%" + ")"}",
                                  textScaleFactor: 1.5,
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  "${bodyFatHume.toStringAsFixed(0) + "%"}",
                                  textScaleFactor: 1.5,
                                  textAlign: TextAlign.center,
                                ),
                              ]),
                              TableRow(children: [
                                Text(
                                  "Peters (for Children)",
                                  textAlign: TextAlign.center,
                                  textScaleFactor: 1.6,
                                  style: new TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "${resultChildren.toStringAsFixed(1) + "kg" + "(" + percentageChildren.toStringAsFixed(0) + "%" + ")"}",
                                  textScaleFactor: 1.5,
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  "${bodyFatChildren.toStringAsFixed(0) + "%"}",
                                  textScaleFactor: 1.5,
                                  textAlign: TextAlign.center,
                                ),
                              ]),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _lbmOperation() {
    h = double.parse(_heightController.text);
    w = double.parse(_weightController.text);
    setState(() {
      if (_radioGender == 1 && _radioAge == 4) {
        resultBoer = 0.407 * w + 0.267 * h - 19.2;
        resultJames = 1.1 * w - (128 * (pow((w / h), 2)));
        resultHume = 0.32810 * w + 0.33929 * h - 29.5336;

        bodyFatBoer = 100 - (resultBoer / w) * 100;
        bodyFatJames = 100 - (resultJames / w) * 100;
        bodyFatHume = 100 - (resultHume / w) * 100;

        percentageBoer = 100 - bodyFatBoer;
        percentageJames = 100 - bodyFatJames;
        percentageHume = 100 - bodyFatHume;

        print(resultBoer);
        print(resultJames);
        print(resultHume);

        print(bodyFatBoer);
        print(bodyFatJames);
        print(bodyFatHume);

        print(percentageBoer);
        print(percentageJames);
        print(percentageHume);
      } else if (_radioGender == 2 && _radioAge == 4) {
        resultBoer = 0.252 * w + 0.473 * h - 48.3;
        resultJames = 1.07 * w - (148 * (pow((w / h), 2)));
        resultHume = 0.29569 * w + 0.41813 * h - 43.2933;

        bodyFatBoer = 100 - (resultBoer / w) * 100;
        bodyFatJames = 100 - (resultJames / w) * 100;
        bodyFatHume = 100 - (resultHume / w) * 100;

        percentageBoer = 100 - bodyFatBoer;
        percentageJames = 100 - bodyFatJames;
        percentageHume = 100 - bodyFatHume;

        print(resultBoer);
        print(resultJames);
        print(resultHume);

        print(bodyFatBoer);
        print(bodyFatJames);
        print(bodyFatHume);

        print(percentageBoer);
        print(percentageJames);
        print(percentageHume);
      } else {
        double evc = 0.0215 * pow(w, 0.6469) * pow(h, 0.7236);
        resultChildren = 3.8 * evc;
        bodyFatChildren = 100 - (resultChildren / w) * 100;
        percentageChildren = 100 - bodyFatChildren;

        print(resultChildren);
        print(percentageChildren);
        print(bodyFatChildren);
      }
    });
  }

  void _resetOperation() {
    _handleRadioValueChange(-1);
    _handleRadioValueChange1(-1);
    _heightController.clear();
    _weightController.clear();
    resultBoer = 0.0;
    resultJames = 0.0;
    resultHume = 0.0;
    resultChildren = 0.0;
    percentageBoer = 0.0;
    percentageJames = 0.0;
    percentageHume = 0.0;
    percentageChildren = 0.0;
    bodyFatBoer = 0.0;
    bodyFatJames = 0.0;
    bodyFatHume = 0.0;
    bodyFatChildren = 0.0;
  }
}
