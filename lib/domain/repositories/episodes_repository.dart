import 'package:dartz/dartz.dart';
import 'package:rick_morty_bloc/data/models/episode_model/result_episode.dart';
import '../../core/errors/failures.dart';

abstract class EposidesRepository {
  Future<Either<Failure, List<ResultEpisode>>> getAllEpisodes(
      List<String> eposides);
}
