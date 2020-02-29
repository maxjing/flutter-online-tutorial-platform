import 'package:cloud_firestore/cloud_firestore.dart';

class Category {
  final String id;
  final String name;
  final String img;
  final List<dynamic> levels;

  Category({this.id, this.name, this.img, this.levels});

  factory Category.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data;

    return Category(
        id: doc.documentID,
        name: data['name'] ?? '',
        img: data['img'] ?? '',
        levels: data['levels'] ?? null);
  }
}

class Course {
  final String name;
  final String img;

  Course({this.name, this.img});

  factory Course.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data;
    return Course(name: data['name'] ?? '', img: data['img'] ?? '');
  }
}
