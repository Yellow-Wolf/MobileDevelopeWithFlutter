import 'package:flutter/material.dart';

void main() => runApp(Lab1());

/// this is your APP Main screen configuration
class Lab1 extends StatelessWidget {
  Lab1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LAb1HomePage(),
    );
  }
}

/// this is a template to start building a UI
/// to start adding any UI you want change what comes after the [ body: ] tag below
class LAb1HomePage extends StatelessWidget {
  LAb1HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff4f4f4),
      /*******************--[focus here 🧐]--*******************/
      appBar: AppBar(
        leading: const Icon(Icons.stars),
        title: const Text('Lab 1'),
        backgroundColor: Colors.teal,
        elevation: 4,
      ),
      body: myWidget(),
      /*******************--[focus here 🧐]--*******************/
    );
  }

  Widget myWidget() {
    return SingleChildScrollView(
        child: Center(
      child: column_start(),
    ));
  }

  Column column_start() {
    return Column(
      children: [
        /*******************--[focus here 🧐]--*******************/
        SizedBox(
          height: 25,
        ),
        exercise1(),
        SizedBox(
          height: 25,
        ),
        exercise2(),
        SizedBox(
          height: 25,
        ),
        exercise3(),
        SizedBox(
          height: 25,
        ),
        exercise4(),
        SizedBox(
          height: 25,
        ),
        exercise5(),
        SizedBox(
          height: 25,
        ),
        exercise6(),
        /*******************--[focus here 🧐]--*******************/
      ],
    );
  }

  /// TODO: Implement Exercises below as per the handed Document
  Widget exercise1() {
    return Text(
      "Welcome to lab1",
      style: TextStyle(
        color: Colors.greenAccent,
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.w500,
        backgroundColor: Colors.grey,
        fontSize: 40,
      ),
    );
  }

  Widget exercise2() {
    return Center(
      child: Icon(
        Icons.share,
        color: Colors.blue,
        size: 200,
        textDirection: TextDirection.rtl,
      ),
    );
  }

  /// TODO : print on the screen on Pressed when clicking on the button, and print on Long Pressed when long click to Button
  Widget exercise3() {
    return Center(
      child: ElevatedButton(
        child: Text(
          "Press me",
          style: TextStyle(color: Colors.yellowAccent),
        ),
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple,
            elevation: 4,
            shape: StadiumBorder(),
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
            textStyle: TextStyle(fontSize: 14)),
        onPressed: () {
          print("your text");
        },
      ),
    );
  }

  Widget exercise4() {
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            elevation: 5,
            padding: EdgeInsets.all(20)),
        child: Icon(
          Icons.favorite,
          color: Colors.greenAccent,
          size: 30,
          textDirection: TextDirection.rtl,
        ),
        onPressed: () {
          print("your text");
        },
      ),
    );
  }

  Widget exercise5() {
    return Center(
      child: OutlinedButton(
        child: Text(
          "Button to press",
          style: TextStyle(color: Colors.orange),
        ),
        style: OutlinedButton.styleFrom(
          //backgroundColor: Colors.blue,
            elevation: 4,
            shape: BeveledRectangleBorder(),
            side: BorderSide(color: Colors.amber),
            textStyle: TextStyle(fontSize: 14)),
        onPressed: () {
          print("press me");
        },
      ),
    );
  }

  Widget exercise6() {
    return Container(
      padding: EdgeInsets.all(50),
      decoration: BoxDecoration(
          color: Colors.yellow,
          border: Border(
            left: BorderSide(color: Colors.purple, width: 7),
            right: BorderSide(color: Colors.purple, width: 7),
            top: BorderSide(color: Colors.cyan, width: 7),
            bottom: BorderSide(color: Colors.orange, width: 7),
          )),
      child: Icon(
        color: Colors.black,
        Icons.report_problem,
        size: 50,
        /*******************--[focus here 🧐]--*******************/
      ),
    );
  }
}
