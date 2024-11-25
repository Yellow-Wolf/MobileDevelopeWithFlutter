import 'dart:async';
import 'dart:convert';

import 'package:asiyncuison/userLesson/AddUserScreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'User.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
              primarySwatch: Colors.deepPurple,
              accentColor: Colors.deepOrangeAccent)),
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
  //List<String> names = [];
  List<User> users = [];
  bool isStacked = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users List"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, AddUserScreen.getRoute());
        },
        child: Icon(Icons.person_add),
      ),
      //body: names.isEmpty ? buildEmptyView() : createListView(),
      body: users.isEmpty ? buildEmptyView() : createListView(),
      //body: createListView(),
    );
  }

  /*Center buildEmptyView() {
    return Center(
      child: Column(
        children: [
          FlutterLogo(
            size: 200,
            style: !isStacked
                ? FlutterLogoStyle.stacked
                : FlutterLogoStyle.horizontal,
          ),
          ElevatedButton(
            onPressed: () {
              getUsers();
              // testFutures1();
            },
            child: Text("Get Users".toUpperCase()),
          ),
        ],
      ),
    );
  }
*/

  Widget buildEmptyView() {
    return FutureBuilder<List<User>>(
        future: getUsers(),
        builder: (context, snapshot) {
      // on Error
      if (snapshot.hasError){
        return Text("Error");
    }
    // on Finish
      if (snapshot.connectionState == ConnectionState.done){
        users = snapshot.data!;
        return buildUserList();
      }

      return Center(child: CircularProgressIndicator());
  });
}



  buildUserList() {
    return RefreshIndicator(
      onRefresh: () {
        return Future.delayed(Duration(seconds: 5), () {});
      },
      child: RefreshIndicator(
        onRefresh: () async {
          //users = [];
          //await /*Future.delayed(Duration(seconds: 3), (){})*/getUsers();
          return Future.value(true);
        },
        child: ListView.builder(
          //itemCount: names.length,//30,
            itemCount: users.length,
            itemBuilder: (BuildContext context, int index) {
              //return Text("Hi");
              // return Icon(Icons.add);
              //return Text(names[index], style: TextStyle(fontSize: 14, ),);
              return Column(
                children: [
                  ListTile(
                      title: Text(
                        users[index].name,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      subtitle: Text(users[index].email),
                      //subtitle: Text(users[index].gender),
                      //leading: Icon(Icons.person),
                      leading: Icon(users[index].gender == "female"
                          ? Icons.female
                          : Icons.male),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          users[index].status == "active"
                              ? Icon(Icons.check,
                              color: Colors.green) // галка для активного пользователя
                              : Icon(Icons. /*close*/ cancel,
                              color: Colors.red), // крестик для неактивного пользователя
                        ],
                      )),
                  Divider()
                ],
              );
            }),
      ),
    );
  }










  createListView() {
    return RefreshIndicator(
      onRefresh: () async {
        users = [];
        await /*Future.delayed(Duration(seconds: 3), (){})*/getUsers();
       return Future.value(true);
      },
      child: ListView.builder(
          //itemCount: names.length,//30,
          itemCount: users.length,
          itemBuilder: (BuildContext context, int index) {
            //return Text("Hi");
            // return Icon(Icons.add);
            //return Text(names[index], style: TextStyle(fontSize: 14, ),);
            return Column(
              children: [
                ListTile(
                    title: Text(
                      users[index].name,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    subtitle: Text(users[index].email),
                    //subtitle: Text(users[index].gender),
                    //leading: Icon(Icons.person),
                    leading: Icon(users[index].gender == "female"
                        ? Icons.female
                        : Icons.male),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        users[index].status == "active"
                            ? Icon(Icons.check,
                                color: Colors.green) // галка для активного пользователя
                            : Icon(Icons. /*close*/ cancel,
                                color: Colors.red), // крестик для неактивного пользователя
                      ],
                    )),
                Divider()
              ],
            );
          }),
    );
  }

/*  getUsers() async {
    print("Connecting to API");
    //Uri url = Uri.parse('https://gorest.co.in/public/v2/users'); // В конце ссылки напиши 1
    Uri url = Uri.parse('https://gorest.co.in/public/v2/users');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      // success
      print(response.body); // без body выведет одну короткую строчку
      //var list = response.body as List; - нет
      var list = jsonDecode(response.body) as List;
      //print(list);
      list.forEach((element) {
        User user = User.fromJson(element);
        print(user);
        //names.add(user.name);
        users.add(user);
        //{id: 6809345, name: Chandran Pothuvaal, email: pothuvaal_chandran@wintheiser.test, gender: female, status: inactive}
        //print(element);
        //print(element["salary"]);
        //print(element["name"]);
        // print(element["name"]);
        //names.add(element["name"]);
      });
      setState(() {});
    } else {
      // failure
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
        'Error ${response.reasonPhrase}',
        style: TextStyle(color: Colors.red),
      )));
    }
  }
*/
 /* Future<List<User>> getUsers() async {
    List<User> usersList = [];
    print("Connecting to internet");
    Response response =
    await http.get(Uri.parse('https://gorest.co.in/public/v2/users'));
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body) as List;
      body.forEach((json) {
        print(json);
        usersList.add(User.fromJson(json));
      });
      setState(() {});
      return usersList;
    }
    return [];
  }
  */ //- тут бяка

  Future<List<User>> getUsers() async {
    List<User> usersList = [];
    print("Connecting to internet");
    Response response = await http.get(Uri.parse('https://gorest.co.in/public/v2/users'));
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body) as List;
      body.forEach((json) {
        print(json);
        usersList.add(User.fromJson(json));
      });
      return usersList;
    }
    throw Exception('Failed to load users');
  }
/*  getUsers() async {
    print("Connecting to API");
    Response response =
          await http.get(Uri.parse('https://gorest.co.in/public/v2/users'));
    if (response.statusCode == 200) {
    final body = jsonDecode(response.body) as List;
      body.forEach((json) {
        print(json);
        users.add(User.fromJson(json));
      });
      setState(() {});
    } else {
      // failure
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            'Error ${response.reasonPhrase}',
            style: TextStyle(color: Colors.red),
          )));
    }
  }
*/
//  testFutures() async {
//    print("I will test Futures");
//    await Future.delayed(Duration(seconds: 2));
//    print("I will test Futures");
//    setState(() {
//      isStacked=!isStacked;
//    });
//  }

//  testFutures1()  {
//   print("I will test Futures");
// Future.delayed(Duration(seconds: 2)).then((value) => setState(() {
//     isStacked=!isStacked;
//}));//.onError((error, stackTrace) => null);
//}
}
