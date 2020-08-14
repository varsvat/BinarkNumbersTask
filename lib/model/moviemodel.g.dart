// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moviemodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoviesModel _$MoviesModelFromJson(Map<String, dynamic> json) {
  return MoviesModel(
    moviesSubModel: (json['Search'] as List)
        ?.map((e) => e == null
            ? null
            : MoviesSubModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    totalResults: json['totalResults'] as int,
    response: json['Response'] as String,
  );
}

Map<String, dynamic> _$MoviesModelToJson(MoviesModel instance) =>
    <String, dynamic>{
      'Search': instance.moviesSubModel,
      'totalResults': instance.totalResults,
      'Response': instance.response,
    };

MoviesSubModel _$MoviesSubModelFromJson(Map<String, dynamic> json) {
  return MoviesSubModel(
    title: json['Title'] as String,
    year: json['Year'] as String,
    imdbID: json['imdbID'] as String,
    type: json['Type'] as String,
    poster: json['Poster'] as String,
  );
}

Map<String, dynamic> _$MoviesSubModelToJson(MoviesSubModel instance) =>
    <String, dynamic>{
      'Title': instance.title,
      'Year': instance.year,
      'imdbID': instance.imdbID,
      'Type': instance.type,
      'Poster': instance.poster,
    };
