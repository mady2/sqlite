import 'package:flutter/material.dart';
import 'package:revison_l3_sqlite/classperson.dart';
import 'package:revison_l3_sqlite/data.dart';

TextEditingController nomperson = new TextEditingController();
TextEditingController ageperson = new TextEditingController();

Data data = new Data();

class ajoute extends StatefulWidget {
  @override
  _ajouteState createState() => _ajouteState();
}

class _ajouteState extends State<ajoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("page3"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          children: [
            TextFormField(
                controller: nomperson,
                decoration: InputDecoration(labelText: "nom")),
            TextFormField(
              controller: ageperson,
              decoration: InputDecoration(labelText: "age"),
              keyboardType: TextInputType.number,
            ),
            RaisedButton(
              child: Text("add"),
              onPressed: () {
                ajout(nomperson.text, double.parse(ageperson.text));
              },
            )
          ],
        ),
      ),
    );
  }
}

void ajout(String nom, var age) {
  Person person = new Person(nom: nom, age: age);
  data.insertperson(person);
  print("Aded");
}
