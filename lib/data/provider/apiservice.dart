import 'package:dio/dio.dart';
import 'package:rickandmortyapp/dominio/entities/character_entitie.dart';


class ApiService {
  final Dio _dio;

  ApiService()
      : _dio = Dio(
          BaseOptions(
            baseUrl: 'https://rickandmortyapi.com/api/',
          ),
        );

        //getter
      Future<List<Character>> getCharacters(int page) async {
  try {
    Response response = await _dio.get('character', queryParameters: {'page': page});
    return (response.data['results'] as List)
        .map((item) => Character.fromJson(item))
        .toList();
  } catch (e) {
    throw Exception('Error al obtener los personajes: $e');
  }
}

Future<List<Character>> getCharacterByName(String name) async {
  try {
    Response response = await _dio.get('character', queryParameters: {'name': name});
    return (response.data['results'] as List)
        .map((item) => Character.fromJson(item))
        .toList();
  } catch (e) {
    throw Exception('Error al obtener los personajes por nombre: $e');
  }
}

}