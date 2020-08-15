import 'package:flutter/material.dart';
import 'package:sailor/sailor.dart';

class DetailsPage extends StatefulWidget {
  // final String title;
  // final String year;
  // final String imdbid;
  // final String type;
  // final String imageurl;

  // DetailsPage({this.title, this.year, this.imdbid, this.type, this.imageurl});
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    final String title = Sailor.param<String>(context, 'title');
    final String year = Sailor.param<String>(context, 'year');
    final String imdbid = Sailor.param<String>(context, 'imdbid');
    final String type = Sailor.param<String>(context, 'type');
    final String imageurl = Sailor.param<String>(context, 'imageurl');
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text('Details'),
          backgroundColor: Colors.grey[900],
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(imageurl),
                radius: MediaQuery.of(context).size.height / 8,
              ),
              SizedBox(
                height: height * .05,
              ),
              Text(
                "Title:  " + title,
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                height: height * .01,
              ),
              Text(
                "Year:  " + year,
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                height: height * .01,
              ),
              Text(
                "ImdbID:  " + imdbid,
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                height: height * .01,
              ),
              Text(
                "Type:  " + type,
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
