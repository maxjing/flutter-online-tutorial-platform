import 'package:airtnl/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../db.dart';
import '../../models/category.dart';

class CategoryList extends StatelessWidget {
  final db = DatabaseService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Category>>.value(
        value: db.streamCategories(), child: CategoryButtons());
  }
}

class CategoryButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var categories = Provider.of<List<Category>>(context);
    return categories == null
        ? LinearProgressIndicator()
        : ListView(
            scrollDirection: Axis.horizontal,
            children: categories.map((category) {
              return Container(
                  width: 70.0,
                  height: 70.0,
                  padding: EdgeInsets.only(right: 10.0),
                  child: GestureDetector(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.network(category.img, fit: BoxFit.cover),
                            Text(
                              category.name,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12.0,
                                  color: Colors.black),
                            ),
                          ]),
                      onTap: () => _onCategoryTap(context, category.id)));
            }).toList());
  }

  _onCategoryTap(BuildContext context, String categoryId) {
    Navigator.pushNamed(context, CoursesRoute, arguments: {'id': categoryId});
  }
}
