import 'package:rick_morty_bloc/data/datasources/eposides_remote_data_source.dart';
import 'package:rick_morty_bloc/data/models/episode_model/result_episode.dart';
import 'package:rick_morty_bloc/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:rick_morty_bloc/domain/repositories/episodes_repository.dart';

import '../../core/errors/exception.dart';
import '../../core/network/network_info.dart';

class EpisodesRepositoryImpl implements EposidesRepository {
  final EposidesRemoteDataSource eposidesRemoteDataSource;
  final NetworkInfo networkInfo;

  EpisodesRepositoryImpl(
      {required this.eposidesRemoteDataSource, required this.networkInfo});
  @override
  Future<Either<Failure, List<ResultEpisode>>> getAllEpisodes(
      List<String> eposides) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await eposidesRemoteDataSource.getAllEposides(eposides);
        return Right(result);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
