import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // to change your app color change this
        primarySwatch: Colors.amber,
      ),
      home: MyHomePage(),
    );
  }
}

/// this is a template to start building a UI
/// to start adding any UI you want change what comes after the [ body: ] tag below
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amber,
        appBar: AppBar(
          title: Text(
            'Flower Shop',
            style: TextStyle(fontFamily: 'casual'),
          ),
          elevation: 0.0,
        ),
        body: ListView(
          children: <Widget>[
            flowerDetails(context),
          ],
        ));
  }
}

Widget flowerDetails(BuildContext context) {
  return Container(
    padding: EdgeInsets.all(20),
    color: Colors.amber,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        imageGroup(),
        titleGroup(),
        iconGroup(),
        textGroup(),
        buttonGroup(),
      ],
    ),
  );
}

/// Image work on Mobile https://newevolutiondesigns.com/images/freebies/yellow-wallpaper-12.jpg
/// Image hat works on Web: https://ichef.bbci.co.uk/images/ic/640x360/p046xkbw.jpg

Widget imageGroup() {
  return Wrap(
    spacing: 0,
    children: [
      AspectRatio(
        aspectRatio: 16 / 9,
        child: Image.network(
          "https://wp-s.ru/wallpapers/11/18/389922058154790/yarkie-podsolnuxi-zhizneradostnyj-blik.jpg",
          fit: BoxFit.cover,
        ),
      ),
    ],
  );
}

Widget titleGroup() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
          padding: EdgeInsets.only(top: 16, bottom: 8),
          child: Text(
            "Sunny Flowers",
            style: TextStyle(fontSize: 52, fontFamily: "cursive"),
          )),
      Text(
        "12 dosen",
        style: TextStyle(fontSize: 14, color: Colors.black54),
      )
    ],
  );
}

Widget iconGroup() {
  return Container(
    padding: EdgeInsets.all(10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(
          Icons.share,
          color: Colors.indigo,
          size: 40,
        ),
        Icon(
          Icons.favorite,
          color: Colors.indigo,
          size: 40,
        )
      ],
    ),
  );
}

/// here is the text to copy
///Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s',
Widget textGroup() {
  return Container(
    padding: EdgeInsets.only(top: 16, bottom: 40),
    //child: Wrap(
    //spacing: 0,
    //children: [
    child: Text(
        textAlign: TextAlign.justify,
        style: TextStyle(fontSize: 14, fontFamily: "casual"),
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"),
    //Text(style: TextStyle(fontSize: 14, fontFamily: "casual"), "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s")
    //],
    //),
  );
}

Widget buttonGroup() {
  return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.indigo,
          padding: EdgeInsets.only(left: 100, right: 100, top: 13, bottom: 13),
          elevation: 10),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(Icons.add_shopping_cart, color: Colors.white),
          Text('ADD TO CART', style: TextStyle(color: Colors.white))
        ],
      ));
}
