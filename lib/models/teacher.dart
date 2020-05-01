import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';

class Teacher {
  final String id;
  final String firstName;
  final String middleName;
  final String lastName;
  final int age;
  final String gender;
  final String phoneNumber;
  final String email;

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
  final bool registered;
  final bool backgroundInfoCompleted;
  final bool tutorialInfoCompleted;

  Teacher({
    this.id,
    this.firstName,
    this.middleName,
    this.lastName,
    this.age,
    this.gender,
    this.phoneNumber,
    this.email,
    this.occupation,
    this.organization,
    this.major,
    this.areas,
    this.teachOnline,
    this.highlight,
    this.introduction,
    this.certificates,
    this.icon,
    this.clicks,
    this.registered,
    this.backgroundInfoCompleted,
    this.tutorialInfoCompleted,
  });

  factory Teacher.initializer() {
    return Teacher(
        firstName: '',
        middleName: '',
        lastName: '',
        age: 0,
        gender: tr('info.gender.hint'),
        email: '',
        occupation: tr('info.occupation.hint'),
        organization: '',
        major: '',
        areas: [],
        teachOnline: false,
        highlight: '',
        introduction: '',
        certificates: [],
        icon:
            'https://firebasestorage.googleapis.com/v0/b/airtnl-6c400.appspot.com/o/userIcons%2FuserIcon-default.jpeg?alt=media&token=81fc6db3-538b-4868-a2c8-abe2f41ecd03',
        registered: false,
        backgroundInfoCompleted: false,
        tutorialInfoCompleted: false);
  }

  factory Teacher.fromMap(Map data) {
    return Teacher(
      firstName: data['firstName'] ?? '',
      middleName: data['middleName'] ?? '',
      lastName: data['lastName'] ?? '',
      age: data['age'] ?? 0,
      gender: data['gender'] ?? '',
      phoneNumber: data['phoneNumber'] ?? '',
      email: data['email'] ?? '',
      occupation: data['occupation'] ?? '',
      organization: data['organization'] ?? '',
      major: data['major'] ?? '',
      areas: data['areas'] ?? '',
      teachOnline: data['teachOnline'] ?? false,
      highlight: data['highlight'] ?? '',
      introduction: data['introduction'] ?? '',
      certificates: data['certificates'] ?? [],
      icon: data['icon'] ?? '',
      clicks: data['clicks'] ?? 0,
      registered: data['registered'] ?? false,
    );
  }

  factory Teacher.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data;

    return Teacher(
      id: doc.documentID.toString(),
      firstName: data['firstName'] ?? '',
      middleName: data['middleName'] ?? '',
      lastName: data['lastName'] ?? '',
      age: data['age'] ?? 0,
      gender: data['gender'] ?? '',
      phoneNumber: data['phoneNumber'] ?? '',
      email: data['email'] ?? '',
      occupation: data['occupation'] ?? '',
      organization: data['organization'] ?? '',
      major: data['major'] ?? '',
      areas: data['areas'] ?? [],
      teachOnline: data['teachOnline'] ?? false,
      highlight: data['highlight'] ?? '',
      introduction: data['introduction'] ?? '',
      certificates: data['certificates'] ?? [],
      icon: data['icon'] ?? '',
      clicks: data['clicks'] ?? 0,
      registered: data['registered'],
    );
  }
}

class Teach {
  final String id;
  final String name;
  final String specify;
  final String description;
  final String category;
  final int hourlyRate;

  Teach(
      {this.id,
      this.name,
      this.specify,
      this.description,
      this.category,
      this.hourlyRate});

  factory Teach.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data;

    return Teach(
        id: doc.documentID,
        name: data['name'] ?? '',
        specify: data['specify'] ?? '',
        description: data['description'] ?? '',
        category: data['category'] ?? '',
        hourlyRate: data['hourlyRate'] ?? null);
  }

  factory Teach.initializer() {
    return Teach(
        id: '',
        name: '',
        specify: '',
        description: '',
        category: 'Academic',
        hourlyRate: 0);
  }
}
