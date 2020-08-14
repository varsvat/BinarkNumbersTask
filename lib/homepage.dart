import 'package:binarynumberstask/mainscreen.dart';
import 'package:binarynumberstask/utils/colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    List<Widget> bottomNavList = <Widget>[
      Text(_selectedIndex.toString()),
      Text(_selectedIndex.toString())
    ];

    return Scaffold(
      backgroundColor: black,
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(
                    bottom: height * 20 / 812, top: height * 10 / 812),
                child: Icon(Icons.home),
              ),
              title: SizedBox.shrink()),
          BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(
                    bottom: height * 20 / 812, top: height * 10 / 812),
                child: Icon(Icons.star),
              ),
              title: SizedBox.shrink()),
          BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(
                    bottom: height * 20 / 812, top: height * 10 / 812),
                child: Icon(Icons.bookmark),
              ),
              title: SizedBox.shrink()),
          BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(
                    bottom: height * 20 / 812, top: height * 10 / 812),
                child: Icon(Icons.menu),
              ),
              title: SizedBox.shrink()),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) => _onItemTapped(index),
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.pinkAccent[400],
      ),
      body: MainScreen(),
      // Center(
      //   child: Text(
      //     "Hey , finally i setup my project  for the task of binary zone IT numbers\n\n\n $_selectedIndex",
      //     textAlign: TextAlign.center,
      //   ),
      // ),
    );
  }
}
