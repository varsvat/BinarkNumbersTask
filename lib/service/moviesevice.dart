import 'package:binarynumberstask/model/moviemodel.dart';
import 'package:chopper/chopper.dart';

part 'moviesevice.chopper.dart';

@ChopperApi(baseUrl: '/')
abstract class MovieService extends ChopperService {
  @Get()
  Future<Response<MoviesModel>> getMoviesList(
      @Query('s') String s, @Query('apikey') String apikey);

  static MovieService create([ChopperClient client]) => _$MovieService(client);
}
