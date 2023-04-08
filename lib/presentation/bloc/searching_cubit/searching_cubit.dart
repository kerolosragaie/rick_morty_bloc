import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'searching_state.dart';

class SearchingCubit extends Cubit<SearchingState> {
  SearchingCubit() : super(IsSearchingState());

  void call(bool isSearching) {
    if (isSearching) {
      emit(IsSearchingState());
    } else {
      emit(IsNotSearchingState());
    }
  }
}
