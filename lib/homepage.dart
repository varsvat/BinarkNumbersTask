import 'package:binarynumberstask/dummytextpage.dart';
import 'package:binarynumberstask/mainscreen.dart';
import 'package:binarynumberstask/utils/colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  void _onItemTapped(int index) {
    print(index);
    index == 3
        ? _scaffoldKey.currentState.openDrawer()
        : setState(() {
            _selectedIndex = index;
          });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    List<Widget> bottomNavList = <Widget>[
      Text(_selectedIndex.toString()),
      Text(_selectedIndex.toString())
    ];

    return Scaffold(
        drawer: Drawer(
          child: Center(
            child: Container(
                width: width * .5,
                child: Text(
                  "This is the drawer , is'nt this an awesome app ?",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 26),
                )),
          ),
        ),
        key: _scaffoldKey,
        backgroundColor: black,
        bottomNavigationBar: Builder(
          builder: (context1) => BottomNavigationBar(
            backgroundColor: Colors.grey[900],
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(
                        bottom: height * 20 / 812, top: height * 20 / 812),
                    child: Icon(Icons.home),
                  ),
                  title: SizedBox.shrink()),
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(
                        bottom: height * 20 / 812, top: height * 20 / 812),
                    child: Icon(Icons.star),
                  ),
                  title: SizedBox.shrink()),
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(
                        bottom: height * 20 / 812, top: height * 20 / 812),
                    child: Icon(Icons.bookmark),
                  ),
                  title: SizedBox.shrink()),
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(
                        bottom: height * 20 / 812, top: height * 20 / 812),
                    child: Icon(Icons.menu),
                  ),
                  title: SizedBox.shrink()),
            ],
            currentIndex: _selectedIndex,
            onTap: (index) {
              _onItemTapped(index);
            },
            unselectedItemColor: grey,
            selectedItemColor: magentamainscreen,
          ),
        ),
        body: _selectedIndex == 0 ? MainScreen() : DummyPage()
        // Center(
        //   child: Text(
        //     "Hey , finally i setup my project  for the task of binary zone IT numbers\n\n\n $_selectedIndex",
        //     textAlign: TextAlign.center,
        //   ),
        // ),
        );
  }
}
