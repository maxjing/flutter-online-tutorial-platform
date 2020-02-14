import 'package:flutter/material.dart';
import '../../helper.dart';
import '../../style.dart';
import 'categoryButton.dart';
import 'recommendBanner.dart';

class Home extends StatelessWidget {
  Widget titleSection = Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              height: getScreenHeight() * 0.045,
              width: getScreenWidth() * 0.4,
              decoration: BoxDecoration(
                  color: ThemeColor,
                  borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(30.0),
                      bottomLeft: const Radius.circular(30.0),
                      bottomRight: const Radius.circular(30.0))),
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(16, 0, 10, 0),
                  child: Icon(
                    Icons.location_on,
                    color: Colors.white,
                    semanticLabel: 'Your Location',
                  ),
                ),
                Text(
                  'Vancouver',
                  style: TextStyle(
                      fontWeight: FontWeight.w300, color: Colors.white),
                )
              ])),
          Container(
              // padding: const EdgeInsets.only(right: 10.0),
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Container(
              padding: const EdgeInsets.only(right: 10),
              child: Icon(
                Icons.mail_outline,
                color: ThemeColor,
                size: 30,
                semanticLabel: 'Messages',
              ),
            ),
            Image.asset(
              'assets/images/profileIcon.png',
              height: getScreenHeight() * 0.045,
              fit: BoxFit.cover,
            ),
          ])),
        ],
      ));

  Widget searchBar = Container(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: SearchBarColor,
        border: InputBorder.none,
        hintText: "what area are you looking for",
        prefixIcon: const Icon(
          Icons.search,
          color: Colors.grey,
        ),
        labelStyle: new TextStyle(color: Colors.black),
        // ),
      ),
    ),
  );

  Widget header = Container(
    padding: const EdgeInsets.all(20),
    child: Image.asset(
      'assets/images/header.png',
      fit: BoxFit.cover,
    ),
  );

  Widget categorySection = Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          'Explore by Category',
          style: TextStyle(
              fontWeight: FontWeight.w500, fontSize: 16.0, color: Colors.black),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          height: getScreenWidth() * 0.3,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              CategoryButton('assets/images/category_1.png', 'Mindset'),
              Padding(padding: EdgeInsets.all(10.00)),
              CategoryButton('assets/images/category_2.png', 'Athletic'),
              Padding(padding: EdgeInsets.all(10.00)),
              CategoryButton('assets/images/category_3.png', 'Academic'),
              Padding(padding: EdgeInsets.all(10.00)),
              CategoryButton('assets/images/category_4.png', 'Arts'),
              Padding(padding: EdgeInsets.all(10.00)),
              CategoryButton('assets/images/category_5.png', 'Skills'),
              Padding(padding: EdgeInsets.all(10.00)),
              CategoryButton('assets/images/category_6.png', 'Others'),
            ],
          ),
        )
      ]));

  Widget recommendSection = Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          'Recommended',
          style: TextStyle(
              fontWeight: FontWeight.w500, fontSize: 16.0, color: Colors.black),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          height: getScreenWidth() * 0.3,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              RecommendBanner(
                  'assets/images/recommend_1.png',
                  'Website Development HTML & CSS',
                  'Learn about basic knowledge on how to build a website'),
              RecommendBanner(
                  'assets/images/recommend_2.png',
                  'Personal Trainer',
                  'Learn about basic knowledge on how to build a website')
            ],
          ),
        )
      ]));

  Widget _bottomNormal() => BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.red,
            icon: Icon(
              Icons.home,
              size: 30,
            ),
            title: Text(
              "Home",
              style: TextStyle(fontSize: 30),
            ),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.red,
            icon: Icon(
              Icons.assignment_ind,
              size: 30,
            ),
            title: Text(
              "User",
              style: TextStyle(fontSize: 30),
            ),
          )
        ],
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        titleSection,
        searchBar,
        header,
        categorySection,
        recommendSection,
        // _bottomNormal()
      ]),
    );
  }
}
