import 'package:cloud_firestore/cloud_firestore.dart';

class Teacher {
  final String id;
  final String firstName;
  final String lastName;
  final int age;
  final int clicks;
  final String description;
  final String icon;

  Teacher(
      {this.id,
      this.firstName,
      this.lastName,
      this.age,
      this.description,
      this.icon,
      this.clicks});

  factory Teacher.fromMap(Map data) {
    return Teacher(
        firstName: data['firstName'] ?? '',
        lastName: data['lastName'] ?? '',
        age: data['age'] ?? '',
        description: data['description'] ?? '',
        icon: data['icon'] ?? '',
        clicks: data['clicks'] ?? 0);
  }

  factory Teacher.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data;

    return Teacher(
        id: doc.documentID,
        firstName: data['firstName'] ?? '',
        lastName: data['lastName'] ?? '',
        age: data['age'] ?? '',
        description: data['description'] ?? '',
        icon: data['icon'] ?? '',
        clicks: data['clicks'] ?? 0);
  }
}

class Teach {
  final String id;
  final String name;
  // final List<String> level;
  final String category;

  Teach({this.id, this.name, this.category});

  factory Teach.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data;

    return Teach(
        id: doc.documentID,
        name: data['name'] ?? '',
        // level: data['level'] ?? [],
        category: data['category'] ?? '');
  }
}
