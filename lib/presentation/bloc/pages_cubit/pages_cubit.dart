import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/util/map_failure_to_message.dart';
import '../../../domain/usecases/get_pages_usecase.dart';

part 'pages_state.dart';

class PagesCubit extends Cubit<PagesState> {
  final GetPagesUseCase getPagesUseCase;
  PagesCubit({required this.getPagesUseCase}) : super(PagesInitial());

  Future<void> getPages() async {
    emit(PagesLoading());
    final data = await getPagesUseCase.call();
    data.fold((failure) {
      emit(ErrorPagesState(
        message: MapFilures.mapFailureToMessage(failure),
      ));
    }, (infoChar) {
      emit(PagesLoaded(pages: infoChar.pages!));
    });
  }
}
