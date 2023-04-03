import 'package:dartz/dartz.dart';
import 'package:rick_morty_bloc/domain/repositories/characters_repository.dart';

import '../../core/errors/failures.dart';
import '../../data/models/character_model/result_char.dart';

class GetCharctersUseCase {
  final CharactersRepository charactersRepository;

  GetCharctersUseCase({required this.charactersRepository});

  Future<Either<Failure, List<ResultChar>>> call() async {
    return await charactersRepository.getAllCharacters();
  }

  Future<Either<Failure, ResultChar>> getCharacter(int charId) async {
    return await charactersRepository.getCharacter(charId);
  }
}
