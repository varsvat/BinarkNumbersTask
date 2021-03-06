import 'package:binarynumberstask/controller/homepagecontroller.dart';
import 'package:binarynumberstask/model/moviemodel.dart';
import 'package:binarynumberstask/utils/colors.dart';
import 'package:binarynumberstask/utils/routes.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  HomePageController homePageController;
  @override
  void initState() {
    // homePageController =
    //     Provider.of<HomePageController>(context, listen: false);
    // homePageController.getMoviesList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
          backgroundColor: black,
          body: Consumer<HomePageController>(
            builder: (context, controller, child) {
              return Column(
                children: [
                  SizedBox(
                    height: height * 36 / 812,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(
                        width: width * 28 / 360,
                      ),
                      GestureDetector(
                        onTap: () => Fluttertoast.showToast(
                            msg: "Profile Icon Tapped",
                            toastLength: Toast.LENGTH_SHORT,
                            backgroundColor: black),
                        child: CircleAvatar(
                          backgroundColor: circleavatarbackground,
                          maxRadius: height * 30 / 812,
                          child: CachedNetworkImage(
                            imageUrl: "https://i.imgur.com/t5ZMkHA.png",
                            placeholder: (context, url) =>
                                CircularProgressIndicator(
                              valueColor:
                                  new AlwaysStoppedAnimation<Color>(black),
                            ),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width * 20 / 360,
                      ),
                      GestureDetector(
                        onTap: () => Fluttertoast.showToast(
                            msg: "Name Tapped",
                            toastLength: Toast.LENGTH_SHORT,
                            backgroundColor: black),
                        child: Text(
                          "Chelsie Brett",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        width: width * 60 / 360,
                      ),
                      GestureDetector(
                        onTap: () => Fluttertoast.showToast(
                            msg: "Search button Tapped",
                            toastLength: Toast.LENGTH_SHORT,
                            backgroundColor: black),
                        child: Container(
                          decoration: BoxDecoration(
                              color: darkgreybackground,
                              borderRadius: BorderRadius.circular(6)),
                          height: height * 40 / 812,
                          child: Row(
                            children: [
                              IconButton(
                                  icon: Icon(Icons.search), onPressed: null),
                              Text(
                                "Search",
                                style: TextStyle(
                                    color: greyText,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                width: width * 20 / 365,
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width * 1 / 360,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 33 / 812,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // SizedBox(
                      //   width: width * 20 / 360,
                      // ),
                      GestureDetector(
                        onTap: () {
                          Routes.sailor.navigate('/dummypage');
                          return Fluttertoast.showToast(
                              msg: "Movies Tab",
                              toastLength: Toast.LENGTH_SHORT,
                              backgroundColor: black);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: darkgreybackground,
                          ),
                          height: height / 26,
                          width: width * 0.22,
                          child: Text(
                            "Movies",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: whitegreytext),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width * 15 / 360,
                      ),
                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: magentamainscreen,
                        ),
                        height: height / 22,
                        width: width * 0.25,
                        child: Text(
                          "Shows",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        width: width * 15 / 360,
                      ),
                      GestureDetector(
                        onTap: () {
                          Routes.sailor.navigate('/dummypage');
                          return Fluttertoast.showToast(
                              msg: "Music Tab",
                              toastLength: Toast.LENGTH_SHORT,
                              backgroundColor: black);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: darkgreybackground,
                          ),
                          height: height / 26,
                          width: width * 0.22,
                          child: Text(
                            "Music",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: whitegreytext),
                          ),
                        ),
                      ),
                      // SizedBox(
                      //   width: width * 20 / 360,
                      // ),
                    ],
                  ),
                  SizedBox(
                    height: height * 33 / 812,
                  ),
                  controller.moviesModel == null
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : Expanded(
                          child: Container(
                              margin: EdgeInsets.only(
                                bottom: height * 10 / 812,
                                left: width * 10 / 365,
                                right: 0,
                              ),
                              color: Colors.transparent,
                              child: ListView(
                                children: [
                                  _returnTypeHeading("NEW", width),
                                  SizedBox(
                                    height: height * 0.35,
                                    child: ListView.builder(
                                      itemCount: controller
                                          .moviesModel.moviesSubModel.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        List<MoviesSubModel> movieList =
                                            controller
                                                .moviesModel.moviesSubModel;
                                        MoviesSubModel movie = movieList[index];
                                        return _returnCard(
                                            movie, width, height, "NEW");
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  _returnTypeHeading("POPULAR", width),
                                  SizedBox(
                                    height: height * 0.35,
                                    child: ListView.builder(
                                      itemCount: controller
                                          .moviesModel.moviesSubModel.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        List<MoviesSubModel> movieList =
                                            controller
                                                .moviesModel.moviesSubModel;
                                        MoviesSubModel movie = movieList[index];
                                        return _returnCard(
                                            movie, width, height, "POPULAR");
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  _returnTypeHeading("TRENDING", width),
                                  SizedBox(
                                    height: height * 0.35,
                                    child: ListView.builder(
                                      itemCount: controller
                                          .moviesModel.moviesSubModel.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        List<MoviesSubModel> movieList =
                                            controller
                                                .moviesModel.moviesSubModel;
                                        MoviesSubModel movie = movieList[index];
                                        return _returnCard(
                                            movie, width, height, "TRENDING");
                                      },
                                    ),
                                  ),
                                ],
                              )))
                ],
              );
            },
          )),
    );
  }

  Padding _returnTypeHeading(String heading, double width) {
    return Padding(
      padding: EdgeInsets.only(
        left: width * 0 / 365,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text("TRENDING",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
          ),
        ],
      ),
    );
  }

  Padding _returnCard(
      MoviesSubModel movie, double width, double height, String typetext) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () {
            Routes.sailor.navigate('/detailspage', params: {
              'title': movie.title,
              'year': movie.year,
              'imdbid': movie.imdbID,
              'type': movie.type,
              'imageurl': movie.poster
            });
          },
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill, image: NetworkImage(movie.poster)),
                    color: Colors.blueGrey[900],
                    borderRadius: BorderRadius.circular(7)),
                width: width * 0.35,
                height: height * 0.32,
              ),
              Positioned(
                  bottom: 0,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4), color: green),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        typetext,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ))
            ],
          ),
        ));
  }
}
