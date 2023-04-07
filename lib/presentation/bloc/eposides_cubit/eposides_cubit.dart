import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty_bloc/data/models/episode_model/result_episode.dart';

import 'package:rick_morty_bloc/domain/usecases/get_eposides_usecase.dart';

import '../../../core/constants/failures.dart';
import '../../../core/errors/failures.dart';

part 'eposides_state.dart';

class EposidesCubit extends Cubit<EposidesState> {
  GetEposidesUsecase getEposidesUsecase;
  EposidesCubit({required this.getEposidesUsecase}) : super(EposidesInitial());

  Future<void> getAllEposides(List<String> eposides) async {
    emit(EposidesLoadingState());
    final data = await getEposidesUsecase.call(eposides);
    data.fold((failure) {
      emit(EposidesErrorState(message: _mapFailureToMessage(failure)));
    }, (allEposides) {
      emit(EposidesLoadedState(allEposides: allEposides));
    });
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case EmptyCacheFailure:
        return EMPTY_CACHE_FAILURE_MESSAGE;
      case OfflineFailure:
        return OFFLINE_FAILURE_MESSAGE;
      default:
        return UNEXPECTED_FAILURE_MESSAGE;
    }
  }
}
