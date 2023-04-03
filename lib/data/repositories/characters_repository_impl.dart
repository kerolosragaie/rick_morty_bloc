import 'package:rick_morty_bloc/core/errors/exception.dart';
import 'package:rick_morty_bloc/core/network/network_info.dart';
import 'package:rick_morty_bloc/data/datasources/characters_remote_data_source.dart';
import 'package:rick_morty_bloc/data/models/character_model/result_char.dart';
import 'package:rick_morty_bloc/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:rick_morty_bloc/domain/repositories/characters_repository.dart';

class CharactersRepositoryImpl implements CharactersRepository {
  final CharactersRemoteDataSource charactersRemoteDataSource;
  final NetworkInfo networkInfo;

  CharactersRepositoryImpl(
      {required this.charactersRemoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, List<ResultChar>>> getAllCharacters() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteCharacters =
            await charactersRemoteDataSource.getAllCharacters();
        return Right(remoteCharacters);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, ResultChar>> getCharacter(int charId) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteCharacter =
            await charactersRemoteDataSource.getCharacter(charId);
        return Right(remoteCharacter);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
