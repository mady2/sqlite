import 'package:revison_l3_sqlite/classperson.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Data {
  Database _database;

  Future openDb() async {
    if (_database == null) {
      _database = await openDatabase(join(await getDatabasesPath(), "Data.db"),
          version: 1, onCreate: (Database db, int version) async {
        await db.execute(
            "CREATE TABLE person (id INTEGER PRIMARY KEY autoincrement , nom TEXT, age REAL)");
      });
    }
  }

  Future<int> insertperson(Person person) async {
    await openDb();
    return await _database.insert('person', person.toMap());
  }

  Future<List<Person>> getpersonlist() async {
    await openDb();
    final List<Map<String, dynamic>> maps = await _database.query('person');
    return List.generate(maps.length, (i) {
      return Person(
        id: maps[i]['id'],
        nom: maps[i]['nom'],
        age: maps[i]['age'],
      );
    });
  }

  Future<void> deleteperson(int id) async {
    await openDb();
    return await _database.delete('person', where: "id = ?", whereArgs: [id]);
  }
}
