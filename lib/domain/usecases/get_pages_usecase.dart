import 'package:dartz/dartz.dart';

import '../../core/errors/failures.dart';
import '../../data/models/character_model/info.dart';
import '../repositories/characters_repository.dart';

class GetPagesUseCase {
  final CharactersRepository charactersRepository;

  GetPagesUseCase(this.charactersRepository);

  Future<Either<Failure, InfoChar>> call() async {
    return await charactersRepository.getResult();
  }
}
