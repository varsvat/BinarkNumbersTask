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
    List<Widget> bottomNavList = <Widget>[
      Text(_selectedIndex.toString()),
      Text(_selectedIndex.toString())
    ];

    return Scaffold(
      backgroundColor: black,
      body: Center(
        child: Text(
          "Hey , finally i setup my project  for the task of binary zone IT numbers\n\n\n $_selectedIndex",
          textAlign: TextAlign.center,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("data")),
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("data")),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) => _onItemTapped(index),
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.pinkAccent[400],
      ),
    );
  }
}
