import 'package:rick_morty_bloc/data/services/character_services.dart';

class CharacterRepository {
  final CharacterServices characterServices;

  CharacterRepository(this.characterServices);

  Future<dynamic> getAllCharacters({int page = 0}) async {
    final response = await characterServices.characterResponse(page: page);
    return response;
  }

  Future<dynamic> getCharacter(int id) async {
    final response = await characterServices.characterResponse(id: id);
    return response.results![id];
  }
}
