import 'dart:convert';

import 'package:debug_logger/debug_logger.dart';
import 'package:http/http.dart';
import 'package:rick_morty_bloc/core/constants/strings.dart';
import 'package:rick_morty_bloc/data/models/character_model/character_model.dart';
import 'package:rick_morty_bloc/data/models/character_model/result_char.dart';

class CharacterServices {
  final String endPoint = "/character";

  /*
  Get all characters
  */
  Future<dynamic> getAllCharacters({int page = 0}) async {
    final uri = Uri.parse("$BASE_URL$endPoint?page=$page");
    Response response = await get(uri);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      //CharacterModel characterModel = CharacterModel.fromJson(body);
      return body;
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

  /*
  Get all characters
  */
  Future<dynamic> characterResponse({int? id, int? page}) async {
    final Uri url;
    if (id != null) {
      url = Uri.parse("$BASE_URL$endPoint/$id");
    } else {
      url = Uri.parse("$BASE_URL$endPoint?page=$page");
    }
    Response response = await get(url);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      CharacterModel characterModel = CharacterModel.fromJson(body);
      return characterModel;
    } else {
      throw "Unable to retrieve this character.";
    }
  }
}
