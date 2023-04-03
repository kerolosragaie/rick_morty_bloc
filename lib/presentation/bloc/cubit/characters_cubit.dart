import 'package:debug_logger/debug_logger.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty_bloc/data/models/character_model/character_model.dart';
import 'package:rick_morty_bloc/data/repositories/character_repository.dart';

import '../../../data/models/character_model/result_char.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharacterRepository characterRepository;
  CharacterModel? characterModel;

  CharactersCubit(this.characterRepository) : super(CharactersInitial());

  CharacterModel getAllCharacters({int page = 0}) {
    characterRepository.getAllCharacters(page: page).then((character) {
      emit(CharacterLoaded(characterModel: character));
      characterModel = character;
    });
    DebugLogger.debug(characterModel);
    return characterModel!;
  }

  ResultChar getCharacter(int id) {
    late ResultChar resultChar;
    characterRepository.getCharacter(id).then((value) {
      emit(CharacterLoaded(resultChar: value));
      resultChar = value;
    });
    return resultChar;
  }
}
