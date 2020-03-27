import 'package:cloud_firestore/cloud_firestore.dart';

class Teacher {
  final String id;
  final String firstName;
  final String middleName;
  final String lastName;
  final int age;
  final String gender;
  final String occupation;
  final String organization;
  final String major;
  final List<dynamic> areas;
  final bool teachOnline;
  final String highlight;
  final String introduction;
  final List<dynamic> certificates;
  final String icon;
  final int clicks;

  Teacher(
      {this.id,
      this.firstName,
      this.middleName,
      this.lastName,
      this.age,
      this.gender,
      this.occupation,
      this.organization,
      this.major,
      this.areas,
      this.teachOnline,
      this.highlight,
      this.introduction,
      this.certificates,
      this.icon,
      this.clicks});

  factory Teacher.fromMap(Map data) {
    return Teacher(
        firstName: data['firstName'] ?? '',
        middleName: data['middleName'] ?? '',
        lastName: data['lastName'] ?? '',
        age: data['age'] ?? '',
        gender: data['gender'] ?? '',
        occupation: data['occupation'] ?? '',
        organization: data['organization'] ?? '',
        major: data['major'] ?? '',
        areas: data['areas'] ?? '',
        teachOnline: data['teachOnline'] ?? false,
        highlight: data['highlight'] ?? '',
        introduction: data['introduction'] ?? '',
        certificates: data['certificates'] ?? [],
        icon: data['icon'] ?? '',
        clicks: data['clicks'] ?? 0);
  }

  factory Teacher.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data;

    return Teacher(
        id: doc.documentID.toString(),
        firstName: data['firstName'] ?? '',
        middleName: data['middleName'] ?? '',
        lastName: data['lastName'] ?? '',
        age: data['age'] ?? '',
        gender: data['gender'] ?? '',
        occupation: data['occupation'] ?? '',
        organization: data['organization'] ?? '',
        major: data['major'] ?? '',
        areas: data['areas'] ?? [],
        teachOnline: data['teachOnline'] ?? false,
        highlight: data['highlight'] ?? '',
        introduction: data['introduction'] ?? '',
        certificates: data['certificates'] ?? [],
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
