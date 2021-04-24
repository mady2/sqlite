import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:revison_l3_sqlite/addperson.dart';
import 'package:revison_l3_sqlite/classperson.dart';
import 'package:revison_l3_sqlite/data.dart';

Data data = new Data();

class Listdesperson extends StatefulWidget {
  @override
  _ListdespersonState createState() => _ListdespersonState();
}

class _ListdespersonState extends State<Listdesperson>
    with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = new TabController(vsync: this, length: 1);
  }

  @override
  void depose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List des person'),
      ),
      body: FutureBuilder(
        future: data.getpersonlist(),
        builder: (context, snapshot) {
          listdesperson = snapshot.data;

          return ListView.builder(
            itemCount: listdesperson.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              Person p = listdesperson[index];
              return ListTile(
                trailing: IconButton(
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          actions: [
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {},
                            )
                          ],
                          content: Container(
                            height: 200,
                            width: 400,
                          ),
                        );
                      },
                    );
                    setState(() {});
                    int i = p.id;
                    data.deleteperson(i);
                    listdesperson.remove(i);
                  },
                ),
                title: Text('${p.nom}'),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Addperson(),
              ));
        },
      ),
    );
  }
}

void submite(context) {
  Person c = new Person(age: 23, nom: 'JO');
  data.insertperson(c);
  Navigator.pop(context);
  print('aded ');
}
