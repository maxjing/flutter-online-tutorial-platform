import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';
import './models/teacher.dart';
import './models/category.dart';

class DatabaseService {
  final Firestore _db = Firestore.instance;

/*  teacher    */
  Future<Teacher> getTeacher(String id) async {
    var snap = await _db.collection('teachers').document(id).get();

    return Teacher.fromMap(snap.data);
  }

  Stream<List<Teacher>> streamTeachers() {
    return _db.collection('teachers').snapshots().map((list) =>
        list.documents.map((doc) => Teacher.fromFirestore(doc)).toList());
  }

  Stream<Teacher> streamTeacher(String id) {
    return _db
        .collection('teachers')
        .document(id)
        .snapshots()
        .map((snap) => Teacher.fromFirestore(snap));
  }

/* teacher subcollection teaches */
  Stream<List<Teach>> streamTeaches(FirebaseUser user) {
    var ref =
        _db.collection('teachers').document(user.uid).collection('teaches');

    return ref.snapshots().map((list) =>
        list.documents.map((doc) => Teach.fromFirestore(doc)).toList());
  }

  Stream<List<Teach>> streamTeachesByUserId(String id) {
    var ref = _db.collection('teachers').document(id).collection('teaches');

    return ref.snapshots().map((list) =>
        list.documents.map((doc) => Teach.fromFirestore(doc)).toList());
  }

  Future<void> createTeacher(
    String userId,
    Map map,
  ) {
    return _db.collection('teachers').document(userId).setData({
      'firstName': map['firstName'],
      'middleName': map['middleName'],
      'lastName': map['lastName'],
      'age': map['age'],
      'gender': map['gender'],
      'occupation': map['occupation'],
      'organization': map['organization'],
      'major': map['major'],
      'areas': map['areas'],
      'teachOnline': map['teachOnline'],
      'highlight': map['highlight'],
      'introduction': map['introduction'],
      'certificates': map['certificates'],
      'icon':
          'https://firebasestorage.googleapis.com/v0/b/airtnl-6c400.appspot.com/o/userIcons%2FuserIcon-default.jpeg?alt=media&token=81fc6db3-538b-4868-a2c8-abe2f41ecd03'
    });
  }

  Future<void> updateCertificates(String userId, List<dynamic> certificates) {
    return _db
        .collection('teachers')
        .document(userId)
        .updateData({'certificates': certificates});
  }

  Future<void> updateSubject(
      String userId, String courseId, String description, int hourlyRate) {
    return _db
        .collection('teachers')
        .document(userId)
        .collection('teaches')
        .document(courseId)
        .updateData({'hourlyRate': hourlyRate, 'description': description});
  }

/*  categories    */
  Stream<List<Category>> streamCategories() {
    return _db.collection('categories').orderBy('order').snapshots().map(
        (list) =>
            list.documents.map((doc) => Category.fromFirestore(doc)).toList());
  }

  /* category subcollection courses */

  Stream<List<Course>> streamCoursesByCategory(String category) {
    var ref =
        _db.collection('categories').document(category).collection('courses');

    return ref.snapshots().map((list) =>
        list.documents.map((doc) => Course.fromFirestore(doc)).toList());
  }

  // Future<void> createHero(FirebaseUser user) {
  //   return _db
  //       .collection('heroes')
  //       .document(user.uid)
  //       .setData({'name': 'DogMan ${user.uid.substring(0, 5)}'});
  // }

  // Future<void> addWeapon(FirebaseUser user, dynamic weapon) {
  //   return _db
  //       .collection('heroes')
  //       .document(user.uid)
  //       .collection('weapons')
  //       .add(weapon);
  // }

  // Future<void> removeWeapon(FirebaseUser user, String id) {
  //   return _db
  //       .collection('heroes')
  //       .document(user.uid)
  //       .collection('weapons')
  //       .document(id)
  //       .delete();
  // }
}
