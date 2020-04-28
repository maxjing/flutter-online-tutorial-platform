import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';

class Teaches {
  final String id;
  final String courseId;
  final String category;
  final List<dynamic> teachers;

  Teaches({this.id, this.courseId, this.category, this.teachers});

  factory Teaches.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data;

    return Teaches(
      id: doc.documentID,
      courseId: data['courseId'] ?? '',
      category: data['category'] ?? '',
      teachers: data['teachers'] ?? '',
    );
  }

  factory Teaches.initializer() {
    return Teaches(id: '', courseId: '', category: '', teachers: []);
  }
}
