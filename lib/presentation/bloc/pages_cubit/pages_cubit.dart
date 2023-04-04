import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/failures.dart';
import '../../../core/errors/failures.dart';
import '../../../domain/usecases/get_pages_usecase.dart';

part 'pages_state.dart';

class PagesCubit extends Cubit<PagesState> {
  final GetPagesUseCase getPagesUseCase;
  PagesCubit({required this.getPagesUseCase}) : super(PagesInitial());

  Future<void> getPages() async {
    final data = await getPagesUseCase.call();
    data.fold((failure) {
      emit(ErrorPagesState(
        message: _mapFailureToMessage(failure),
      ));
    }, (infoChar) {
      emit(PagesLoaded(pages: infoChar.pages!));
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
