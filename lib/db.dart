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
        .map((snap) => Teacher.fromMap(snap.data));
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
