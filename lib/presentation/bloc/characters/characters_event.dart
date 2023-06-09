part of 'characters_bloc.dart';

abstract class CharactersEvent extends Equatable {
  const CharactersEvent();

  @override
  List<Object> get props => [];
}

class GetAllCharactersEvent extends CharactersEvent {
  final int page;

  const GetAllCharactersEvent({required this.page});
  @override
  List<Object> get props => [page];
}

class GetCharacterEvent extends CharactersEvent {
  final ResultChar character;

  const GetCharacterEvent({required this.character});
  @override
  List<Object> get props => [character];
}

class RefreshEvent extends CharactersEvent {}
