class Person {
  int id;
  String nom;
  var age;
  Person({this.age, this.id, this.nom});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nom': nom,
      'age': age,
    };
  }
}

List<Person> listdesperson = [];
