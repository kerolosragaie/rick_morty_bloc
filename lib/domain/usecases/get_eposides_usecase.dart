import 'package:dartz/dartz.dart';
import 'package:rick_morty_bloc/data/models/episode_model/result_episode.dart';
import 'package:rick_morty_bloc/domain/repositories/episodes_repository.dart';

import '../../core/errors/failures.dart';

class GetEposidesUsecase {
  final EposidesRepository eposidesRepository;

  GetEposidesUsecase(this.eposidesRepository);

  Future<Either<Failure, List<ResultEpisode>>> call(
      List<String> eposides) async {
    return await eposidesRepository.getAllEpisodes(eposides);
  }
}
