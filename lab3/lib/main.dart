import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //bool _expanded = false;
  bool isOpened = false;
  bool isRectangle = true;
  int count = 1;
  bool locked = true;
  //void _changeHeight() {
  //  setState(() {
  //    _expanded = !_expanded;
  //  });
  //}
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text(
          'Lab 3',
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: AnimatedContainer(
        margin: EdgeInsets.all(20),
        duration: Duration(milliseconds: 450),
        width: screenWidth,
        //height: _expanded ? screenHeight : 60,
        height: isOpened ? screenHeight : 60,

        color: Colors.indigo,
        // to 0 when click on it, to screen height when also click on it
        child: Stack(
          children: [
            Container(
              height: 60,
              padding: EdgeInsets.symmetric(horizontal: 16),
              color: Colors.yellow,
              child: InkWell(
                onTap: () {
                  //_changeHeight(); // Вызываем функцию для изменения состояния
                  setState(() {
                    isOpened = !isOpened;
                  });
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        'Click to Expand',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    // Условный оператор, который позволяет изменять иконку в зависимости от состояния _expanded
                    Icon(//_expanded
                        isOpened
                            ? Icons.keyboard_arrow_down
                            : Icons.keyboard_arrow_up),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    changeShapes(screenWidth),
                    flutterChanger(screenWidth),
                    showHide(screenWidth),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget changeShapes(double width) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Container(
            margin: EdgeInsets.all(8),
            color: Colors.white,
            width: width,
            height: 150,

            /// ********** Do changes in child below ********** ///
            child: Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      isRectangle = !isRectangle;
                    });
                  },
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      shape: isRectangle ? BoxShape.rectangle : BoxShape.circle,
                      color: isRectangle ? Colors.red : Colors.blue,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      isRectangle = !isRectangle;
                    });
                  },
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      shape:
                          !isRectangle ? BoxShape.rectangle : BoxShape.circle,
                      color: !isRectangle ? Colors.red : Colors.blue,
                    ),
                  ),
                )
              ],
            ))),
      ),
    );
  }

  FlutterLogoStyle decideStyle() {
    if (count == 1)
      return FlutterLogoStyle.stacked;
    else if (count == 2) return FlutterLogoStyle.horizontal;

    return FlutterLogoStyle.markOnly;
  }

  Widget flutterChanger(double width) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Container(
            margin: EdgeInsets.all(8),
            color: Colors.white,
            width: width,
            height: 150,

            /// ********** Do changes in child below ********** ///
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FlutterLogo(
                  style: decideStyle(),
                  size: 100,
                ),
                IconButton(
                    onPressed: () {
                      setState(() {
                        count++;
                        if (count >= 4) count = 1;
                      });
                    },
                    icon: Icon(
                      Icons.change_circle_rounded,
                      size: 50,
                    ))
              ],
            )),
      ),
    );
  }

  Widget showHide(double width) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Container(
            margin: EdgeInsets.all(8),
            color: Colors.white,
            width: width,
            height: 150,

            /// ********** Do changes in child below ********** ///
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Visibility(
                      visible: locked,
                      child: Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: 100,
                      )),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        locked = !locked;
                      });
                    },
                    icon: Icon(
                      locked ? Icons.lock_open : Icons.lock_outlined,
                      size: 50,
                      color: Colors.purple,
                    ),
                  )
                ])),
      ),
    );
  }
}
