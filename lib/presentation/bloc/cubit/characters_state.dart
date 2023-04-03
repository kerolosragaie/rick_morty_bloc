part of 'characters_cubit.dart';

abstract class CharactersState {}

class CharactersInitial extends CharactersState {}

class CharacterError extends CharactersState {
  //write what will happens in state of error
}

class CharacterLoaded extends CharactersState {
  final CharacterModel? characterModel;
  final ResultChar? resultChar;
  CharacterLoaded({this.characterModel, this.resultChar});
}
