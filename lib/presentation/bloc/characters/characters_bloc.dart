import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rick_morty_bloc/data/models/character_model/result_char.dart';
import 'package:rick_morty_bloc/domain/usecases/get_characters_usecase.dart';
import '../../../core/util/map_failure_to_message.dart';

part 'characters_event.dart';
part 'characters_state.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  final GetCharctersUseCase getCharctersUseCase;

  CharactersBloc({required this.getCharctersUseCase})
      : super(CharactersInitial()) {
    on<CharactersEvent>((event, emit) async {
      if (event is GetAllCharactersEvent) {
        emit(LoadingState());
        final data = await getCharctersUseCase.call(page: event.page);
        data.fold((failure) {
          emit(ErrorState(message: MapFilures.mapFailureToMessage(failure)));
        }, (characters) {
          emit(LoadedCharactersState(characters: characters));
        });
      } else if (event is GetCharacterEvent) {
        emit(LoadingState());
        final data =
            await getCharctersUseCase.getCharacter(event.character.id!.toInt());
        data.fold((failure) {
          emit(ErrorState(message: MapFilures.mapFailureToMessage(failure)));
        }, (character) {
          emit(LoadedCharacterState(character: character));
        });
      }
    });
  }
}
