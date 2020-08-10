import 'package:binarynumberstask/homepage.dart';
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
    });
    final chopperClient = ChopperClient(
        baseUrl: "http://www.omdbapi.com/",
        services: [],
        converter: converter,
        errorConverter: JsonConverter());

    sailor.addRoute(SailorRoute(
      name: '/homepage',
      builder: (context, args, paramMap) => HomePage(),
    ));
  }
}
