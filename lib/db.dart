import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'dart:async';
import './models/teacher.dart';
import './models/category.dart';
// import './models/teaches.dart';
import 'dart:developer';

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

  List<Stream<Teacher>> streamTeachersByIds(List<String> ids) {
    List<Stream<Teacher>> teachers;

    teachers.add(streamTeacher('pDBLYyP1v6S60EpRo6dOkivIUtx1'));
    return teachers;

    // return _db
    //     .collection('teachers')
    //     .where(, whereIn: ['jj', 'wjwjw'])
    //     .snapshots()
    //     .map((list) =>
    //         list.documents.map((doc) => Teacher.fromFirestore(doc)).toList());
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
      'age': int.parse(map['age']),
      'gender': map['gender'],
      'phoneNumber': map['phoneNumber'],
      'email': map['email'],
      'registered': true,
      'icon':
          'https://firebasestorage.googleapis.com/v0/b/airtnl-6c400.appspot.com/o/userIcons%2FuserIcon-default.jpeg?alt=media&token=81fc6db3-538b-4868-a2c8-abe2f41ecd03'
    });
  }

  Future<void> updateTeacherPersonal(
    String userId,
    Map map,
  ) {
    return _db.collection('teachers').document(userId).updateData({
      'firstName': map['firstName'],
      'middleName': map['middleName'],
      'lastName': map['lastName'],
      'age': map['age'],
      'gender': map['gender'],
      'phoneNumber': map['phoneNumber'],
      'email': map['email'],
      'icon':
          'https://firebasestorage.googleapis.com/v0/b/airtnl-6c400.appspot.com/o/userIcons%2FuserIcon-default.jpeg?alt=media&token=81fc6db3-538b-4868-a2c8-abe2f41ecd03'
    });
  }

  Future<void> createTeacherBackground(
    String userId,
    Map map,
  ) {
    return _db.collection('teachers').document(userId).setData({
      'age': 0,
      'occupation': map['occupation'],
      'organization': map['organization'],
      'major': map['major'],
      'certificates': map['certificates'],
      'registered': true,
      'backgroundInfoCompleted': true,
    });
  }

  Future<void> updateTeacherBackground(
    String userId,
    Map map,
  ) {
    return _db.collection('teachers').document(userId).updateData({
      'occupation': map['occupation'],
      'organization': map['organization'],
      'major': map['major'],
      'certificates': map['certificates'],
      'backgroundInfoCompleted': true,
    });
  }

  Future<void> createTeacherTutorial(
    String userId,
    Map map,
  ) {
    return _db.collection('teachers').document(userId).setData({
      'age': 0,
      'highlight': map['highlight'],
      'introduction': map['introduction'],
      'areas': map['areas'],
      'teachOnline': map['teachOnline'],
      'registered': true,
      'tutorialInfoCompleted': true,
    });
  }

  Future<void> updateTeacherTutorial(
    String userId,
    Map map,
  ) {
    return _db.collection('teachers').document(userId).updateData({
      'highlight': map['highlight'],
      'introduction': map['introduction'],
      'areas': map['areas'],
      'teachOnline': map['teachOnline'],
      'tutorialInfoCompleted': true,
    });
  }

  Future<void> updateCertificates(String userId, List<dynamic> certificates) {
    return _db
        .collection('teachers')
        .document(userId)
        .updateData({'certificates': certificates});
  }

  Future<void> updateSubject(String userId, String subjectId, Map map) {
    return _db
        .collection('teachers')
        .document(userId)
        .collection('teaches')
        .document(subjectId)
        .updateData({
      'category': map['category'],
      'name': map['name'],
      'description': map['description'],
      'hourlyRate': int.parse(map['hourlyRate'])
    });
  }

  Future<void> createSubject(String userId, String subjectId, Map map) {
    return _db
        .collection('teachers')
        .document(userId)
        .collection('teaches')
        .add({
      'category': map['category'],
      'name': map['name'],
      'specify': map['specify'],
      'description': map['description'],
      'hourlyRate': int.parse(map['hourlyRate'])
    });
  }

  Future<void> deleteSubject(String userId, String subjectId) {
    return _db
        .collection('teachers')
        .document(userId)
        .collection('teaches')
        .document(subjectId)
        .delete();
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

/* category course teachers  */
  Stream<List<Teachers>> streamTeachersByCourse(
      String category, String course) {
    var ref = _db
        .collection('categories')
        .document(category)
        .collection('courses')
        .document(course)
        .collection('teachers');

    return ref.snapshots().map((list) =>
        list.documents.map((doc) => Teachers.fromFirestore(doc)).toList());
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
