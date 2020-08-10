import 'dart:convert';

import 'package:chopper/chopper.dart';

class JsonSerializableConverter extends JsonConverter {
  final Map<Type, Function> typeToJsonFactoryMap;

  JsonSerializableConverter(this.typeToJsonFactoryMap);

  @override
  Response<BodyType> convertResponse<BodyType, InnerType>(Response response) {
    return response.replace(
      body: fromJsonData<BodyType, InnerType>(
          response.body, typeToJsonFactoryMap[InnerType]),
    );
  }

  T fromJsonData<T, InnerType>(String jsonData, Function jsonParser) {
    var jsonMap = json.decode(jsonData);
    if (jsonMap is List) {
      return jsonMap
          .map((item) => jsonParser(item as Map<String, dynamic>) as InnerType)
          .toList() as T;
    }
    if (jsonMap is Map) {}
    var parsedJson = jsonParser(jsonMap);
    return parsedJson;
  }
}