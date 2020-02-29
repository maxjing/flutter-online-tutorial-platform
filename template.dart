// import 'package:flutter/material.dart';

// class Home extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Hello'),
//       ),
//       body: Text(''),
//     );
//   }
// }
// import 'package:airtnl/screens/home/categoryButton.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../../db.dart';
// import '../../helper.dart';
// import '../../models/category.dart';

// class CategoryList extends StatelessWidget {
//   final db = DatabaseService();
//   final String _assetPath;
//   final String _text;

//   CategoryList(this._assetPath, this._text);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 60.0,
//       height: 60.0,
//       child: StreamProvider<List<Category>>.value(
//           value: db.streamCategories(), child: CategoryButtons()),
//     );
//   }
// }

// class CategoryButtons {

//   @override
//   Widget build(BuildContext context) {
//       var categories = Provider.of<List<Category>>(context);
//     return Row(
//       children: categories.map((category){

//       }).toList(),
//     );
//   }
// }
// class Courses extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(body: Container(child: Text('hihi')));
//   }
// }

// class Courses extends StatefulWidget {
//   final String _category;
//   Courses(this._category);
//   @override
//   _CoursesState createState() => _CoursesState();
// }

// class _CoursesState extends State<Courses> {
//   final String category;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(body: Container(child: Text('hihi')));
//   }
// }
