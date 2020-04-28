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
  final String id;
  final String name;
  final String img;

  Course({this.id, this.name, this.img});

  factory Course.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data;
    return Course(
        id: doc.documentID, name: data['name'] ?? '', img: data['img'] ?? '');
  }
}

class Teachers {
  final String id;
  final String teacherId;

  Teachers({this.id, this.teacherId});

  factory Teachers.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data;
    return Teachers(id: data['id'] ?? '', teacherId: data['teacherId'] ?? '');
  }
}
