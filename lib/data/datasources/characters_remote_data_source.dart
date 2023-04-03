import 'dart:convert';
import 'package:rick_morty_bloc/core/constants/api.dart';
import 'package:rick_morty_bloc/core/errors/exception.dart';
import 'package:rick_morty_bloc/data/models/character_model/result_char.dart';
import 'package:http/http.dart' as http;

abstract class CharactersRemoteDataSource {
  Future<List<ResultChar>> getAllCharacters();
  Future<ResultChar> getCharacter(int charId);
}

class CharactersRemoteDataSourceImpl extends CharactersRemoteDataSource {
  final http.Client client;

  CharactersRemoteDataSourceImpl({required this.client});
  @override
  Future<List<ResultChar>> getAllCharacters() async {
    final response = await client.get(Uri.parse("$BASE_URL/character"),
        headers: {"Content-Type": "application/json"});
    if (response.statusCode == 200) {
      final decodedJson = json.decode(response.body) as List;
      final List<ResultChar> charactersModels =
          decodedJson.map((e) => ResultChar.fromJson(e)).toList();
      return charactersModels;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<ResultChar> getCharacter(int charId) async {
    final response = await client.get(Uri.parse("$BASE_URL/character/$charId"),
        headers: {"Content-Type": "application/json"});
    if (response.statusCode == 200) {
      final decodedJson = json.decode(response.body);
      final ResultChar characterModel =
          decodedJson.map((e) => ResultChar.fromJson(e));
      return characterModel;
    } else {
      throw ServerException();
    }
  }
}
