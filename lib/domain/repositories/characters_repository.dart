import 'package:rick_morty_bloc/data/models/character_model/result_char.dart';
import 'package:dartz/dartz.dart';

import '../../core/errors/failures.dart';

abstract class CharactersRepository {
  Future<Either<Failure, List<ResultChar>>> getAllCharacters();
  Future<Either<Failure, ResultChar>> getCharacter(int charId);
}
