import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty_bloc/data/models/episode_model/result_episode.dart';
import 'package:rick_morty_bloc/domain/usecases/get_eposides_usecase.dart';
import '../../../core/util/map_failure_to_message.dart';

part 'eposides_state.dart';

class EposidesCubit extends Cubit<EposidesState> {
  GetEposidesUsecase getEposidesUsecase;
  EposidesCubit({required this.getEposidesUsecase}) : super(EposidesInitial());

  Future<void> getAllEposides(List<String> eposides) async {
    emit(EposidesLoadingState());
    final data = await getEposidesUsecase.call(eposides);
    data.fold((failure) {
      emit(
          EposidesErrorState(message: MapFilures.mapFailureToMessage(failure)));
    }, (allEposides) {
      emit(EposidesLoadedState(allEposides: allEposides));
    });
  }
}
