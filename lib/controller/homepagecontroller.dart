import 'package:binarynumberstask/model/moviemodel.dart';
import 'package:binarynumberstask/service/moviesevice.dart';
import 'package:chopper/chopper.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePageController with ChangeNotifier {
  final MovieService movieService;

  HomePageController({this.movieService}) {
    getMoviesList();
  }

  MoviesModel moviesModel;

  Future getMoviesList() async {
    print("Starting of the getmovieslist function");
    try {
      Response<MoviesModel> moviesList =
          await movieService.getMoviesList('Movies', '5661d041');

      moviesModel = moviesList.body;

      if (moviesList.statusCode == 200) {
        print("Succesfully fetched the movielist");
      } else {
        print("the status code of the response recieved is not 200");
      }
    } catch (e) {
      Fluttertoast.showToast(
          msg: "Some error occurred , Kindly Check your internet connection");
      print("Inside the catch block of the getmovielist function    $e");
    }
    notifyListeners();
  }
}
