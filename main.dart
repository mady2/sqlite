import 'package:flutter/material.dart';
import 'package:revison_l3_sqlite/Listdesperso.dart';
import 'package:revison_l3_sqlite/add.dart';
import 'package:revison_l3_sqlite/classperson.dart';
import 'package:revison_l3_sqlite/data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('My app'),
        ),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            RaisedButton(
              child: Text('Page1'),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Page2(),
                    ));
              },
            ),
            RaisedButton(
              child: Text('Page2'),
              onPressed: () {},
            ),
            RaisedButton(
              child: Text('Page3'),
              onPressed: () {},
            ),
          ]),
        ));
  }
}

Data data = new Data();

class Page2 extends StatefulWidget {
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: data.getpersonlist(),
        builder: (context, snapshot) {
          listdesperson = snapshot.data;

          return ListView.builder(
            itemCount: listdesperson.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              Person person = listdesperson[index];
              return ListTile(
                title: Text('${person.nom}'),
                subtitle: Text('${person.age}'),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return ajoute();
            },
          ));
        },
      ),
    );
  }
}
