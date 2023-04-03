import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rick_morty_bloc/data/models/character_model/result_char.dart';
import 'package:rick_morty_bloc/domain/usecases/get_characters_usecase.dart';
import '../../../core/constants/failures.dart';
import '../../../core/errors/failures.dart';

part 'characters_event.dart';
part 'characters_state.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  final GetCharctersUseCase getCharctersUseCase;

  CharactersBloc({required this.getCharctersUseCase})
      : super(CharactersInitial()) {
    on<CharactersEvent>((event, emit) async {
      if (event is GetAllCharactersEvent || event is RefreshEvent) {
        emit(LoadingState());
        final data = await getCharctersUseCase.call();
        data.fold((failure) {
          emit(ErrorState(message: _mapFailureToMessage(failure)));
        }, (characters) {
          emit(LoadedCharactersState(characters: characters));
        });
      } else if (event is GetCharacterEvent) {
        emit(LoadingState());
        final data =
            await getCharctersUseCase.getCharacter(event.character.id!.toInt());
        data.fold((failure) {
          emit(ErrorState(message: _mapFailureToMessage(failure)));
        }, (character) {
          emit(LoadedCharacterState(character: character));
        });
      }
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
