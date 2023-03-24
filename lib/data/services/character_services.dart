import 'dart:convert';

import 'package:http/http.dart';
import 'package:rick_morty_bloc/constants/strings.dart';
import 'package:rick_morty_bloc/data/models/character_model/character_model.dart';
import 'package:rick_morty_bloc/data/models/character_model/result_char.dart';

class CharacterSeervices {
  final String endPoint = "/character";

  /*
  Get all characters
  */
  Future<List<ResultChar>> getAllCharacters() async {
    final url = Uri.parse(BASE_URL + endPoint);
    Response response = await get(url);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      CharacterModel characterModel = CharacterModel.fromJson(body);
      return characterModel.results!;
    } else {
      throw "Unable to retrieve characters.";
    }
  }

  /*
  Get specific character using id
  */
  Future<ResultChar> getCharacter(int id) async {
    final url = Uri.parse("$BASE_URL$endPoint/$id");
    Response response = await get(url);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      CharacterModel characterModel = CharacterModel.fromJson(body);
      return characterModel.results![id];
    } else {
      throw "Unable to retrieve this character.";
    }
  }
}
