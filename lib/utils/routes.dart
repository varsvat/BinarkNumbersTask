import 'package:binarynumberstask/controller/homepagecontroller.dart';
import 'package:binarynumberstask/detailsPage.dart';
import 'package:binarynumberstask/dummytextpage.dart';
import 'package:binarynumberstask/homepage.dart';
import 'package:binarynumberstask/mainscreen.dart';
import 'package:binarynumberstask/model/moviemodel.dart';
import 'package:binarynumberstask/service/moviesevice.dart';
import 'package:binarynumberstask/utils/jsonserializable.dart';
import 'package:chopper/chopper.dart';
import 'package:provider/provider.dart';
import 'package:sailor/sailor.dart';

class Routes {
  static final sailor = Sailor(
    options: SailorOptions(
      handleNameNotFoundUI: true,
      isLoggingEnabled: true,
    ),
  );

  static void createRoutes() {
    final converter = JsonSerializableConverter({
      dynamic: (jsonData) => jsonData,
      MoviesModel: (jsonData) => MoviesModel.fromJson(jsonData),
      MoviesSubModel: (jsonData) => MoviesSubModel.fromJson(jsonData),
    });
    final chopperClient = ChopperClient(
        baseUrl: "http://www.omdbapi.com",
        services: [
          MovieService.create(),
        ],
        converter: converter,
        errorConverter: JsonConverter());

    sailor.addRoute(SailorRoute(
      name: '/homepage',
      builder: (context, args, paramMap) {
        return ChangeNotifierProvider(
          create: (context) => HomePageController(
            movieService: chopperClient.getService<MovieService>(),
          ),
          child: HomePage(),
        );
        // return HomePage();
      },
    ));
    sailor.addRoute(SailorRoute(
      name: '/mainpage',
      builder: (context, args, paramMap) {
        return ChangeNotifierProvider(
          create: (context) => HomePageController(
            movieService: chopperClient.getService<MovieService>(),
          ),
          child: MainScreen(),
        );
        // return HomePage();
      },
    ));
    sailor.addRoute(SailorRoute(
        name: '/detailspage',
        builder: (context, args, paramMap) {
          return DetailsPage();
        },
        params: [
          SailorParam<String>(
              name: 'title', isRequired: true, defaultValue: 'Movie title'),
          SailorParam<String>(
              name: 'year', isRequired: true, defaultValue: 'Movie year'),
          SailorParam<String>(
              name: 'imdbid', isRequired: true, defaultValue: 'Movie imdbid'),
          SailorParam<String>(
              name: 'type', isRequired: true, defaultValue: 'Movie type'),
          SailorParam<String>(
              name: 'imageurl',
              isRequired: true,
              defaultValue: 'Movie imageurl'),
        ]));
    sailor.addRoute(SailorRoute(
      name: '/dummypage',
      builder: (context, args, paramMap) => DummyPage(),
    ));
  }
}
