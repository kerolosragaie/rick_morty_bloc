part of 'characters_bloc.dart';

abstract class CharactersState extends Equatable {
  const CharactersState();

  @override
  List<Object> get props => [];
}

class CharactersInitial extends CharactersState {}

class LoadingState extends CharactersState {}

class LoadedCharactersState extends CharactersState {
  final List<dynamic> characters;

  const LoadedCharactersState({required this.characters});
  @override
  List<Object> get props => [characters];
}

class LoadedCharacterState extends CharactersState {
  final ResultChar character;

  const LoadedCharacterState({required this.character});
  @override
  List<Object> get props => [character];
}

class ErrorState extends CharactersState {
  final String message;

  const ErrorState({required this.message});
  @override
  List<Object> get props => [message];
}
