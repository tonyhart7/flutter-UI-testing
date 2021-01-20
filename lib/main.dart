import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:ui_testing/misc/constant.dart';

import 'package:ui_testing/multiple_screen/screen1.dart';
import 'package:ui_testing/multiple_screen/screen2.dart';
import 'package:ui_testing/multiple_screen/screen3.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: lPrimaryColor,
        appBarTheme: AppBarTheme(
          brightness: Theme.of(context).brightness,
        ),
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // pageview
  static int _selectedIndex = 0;
  PageController pageViewController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    pageViewController.dispose();
  }

  // pageView method
  void pageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void bottomTapped(int index) {
    setState(() {
      if ((_selectedIndex - index).abs() == 1) {
        pageViewController.animateToPage(index,
            duration: const Duration(milliseconds: 300), curve: Curves.ease);
      } else {
        pageViewController.jumpToPage(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        extendBody: true,
        body: PageView(
          controller: pageViewController,
          onPageChanged: (index) {
            pageChanged(index);
          },
          children: [
            Screen1(),
            Screen2(),
            Screen3(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0.0,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blueAccent,
          onTap: (index) {
            bottomTapped(index);
          },
          // backgroundColor: lSecondaryColor, // flat color
          backgroundColor: Color(0x00ffffff), // transparent
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.white,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.color_lens_outlined),
              label: 'Green',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.color_lens_outlined),
              label: 'Red',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.color_lens_outlined),
              label: 'Blue',
            ),
          ],
        ),
      ),
    );
  }
}
