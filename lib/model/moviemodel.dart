import 'package:json_annotation/json_annotation.dart';

part 'moviemodel.g.dart';

@JsonSerializable()
class MoviesModel {
  @JsonKey(name: 'Search', includeIfNull: true)
  List<MoviesSubModel> moviesSubModel;

  @JsonKey(name: 'totalResults', includeIfNull: true)
  final String totalResults;

  @JsonKey(name: 'Response', includeIfNull: true)
  final String response;

  MoviesModel({this.moviesSubModel, this.totalResults, this.response});

  factory MoviesModel.fromJson(Map<String, dynamic> json) =>
      _$MoviesModelFromJson(json);
  Map<String, dynamic> toJson() => _$MoviesModelToJson(this);
}

@JsonSerializable()
class MoviesSubModel {
  @JsonKey(name: 'Title')
  final String title;

  @JsonKey(name: 'Year')
  final String year;

  @JsonKey(name: 'imdbID')
  final String imdbID;

  @JsonKey(name: 'Type')
  final String type;

  @JsonKey(name: 'Poster')
  final String poster;

  MoviesSubModel({this.title, this.year, this.imdbID, this.type, this.poster});
  factory MoviesSubModel.fromJson(Map<String, dynamic> json) =>
      _$MoviesSubModelFromJson(json);
  Map<String, dynamic> toJson() => _$MoviesSubModelToJson(this);
}
