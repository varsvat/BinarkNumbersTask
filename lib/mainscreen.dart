import 'package:binarynumberstask/utils/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: black,
        body: Column(
          children: [
            SizedBox(
              height: height * 46 / 812,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  width: width * 28 / 360,
                ),
                CircleAvatar(
                  backgroundColor: Colors.grey[300],
                  maxRadius: height * 30 / 812,
                  child: CachedNetworkImage(
                    imageUrl: "https://i.imgur.com/t5ZMkHA.png",
                    placeholder: (context, url) => CircularProgressIndicator(
                      valueColor:
                          new AlwaysStoppedAnimation<Color>(Colors.grey[400]),
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                SizedBox(
                  width: width * 20 / 360,
                ),
                Text(
                  "Chelsie Brett",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: width * 75 / 360,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(6)),
                  height: height * 40 / 812,
                  child: Row(
                    children: [
                      IconButton(icon: Icon(Icons.search), onPressed: null),
                      Text("data"),
                      SizedBox(
                        width: width * 20 / 365,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: width * 1 / 360,
                ),
              ],
            ),
            SizedBox(
              height: height * 46 / 812,
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 25,
                itemBuilder: (context, index) {
                  Container(
                    color: Colors.white,
                    child: Text(
                      index.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
