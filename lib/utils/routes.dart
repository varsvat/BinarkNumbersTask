import 'package:binarynumberstask/homepage.dart';
import 'package:binarynumberstask/model/moviemodel.dart';
import 'package:binarynumberstask/service/moviesevice.dart';
import 'package:binarynumberstask/utils/jsonserializable.dart';
import 'package:chopper/chopper.dart';
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
      builder: (context, args, paramMap) => HomePage(),
    ));
  }
}
