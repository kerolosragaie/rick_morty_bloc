import 'package:rick_morty_bloc/data/models/character_model/result_char.dart';
import 'package:dartz/dartz.dart';

import '../../core/errors/failures.dart';
import '../../data/models/character_model/info.dart';

abstract class CharactersRepository {
  Future<Either<Failure, InfoChar>> getResult();
  Future<Either<Failure, List<dynamic>>> getAllCharacters({required int page});
  Future<Either<Failure, ResultChar>> getCharacter(int charId);
}
