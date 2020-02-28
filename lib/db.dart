import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';
import './models/teacher.dart';

class DatabaseService {
  final Firestore _db = Firestore.instance;

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

  /// Query a subcollection
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
