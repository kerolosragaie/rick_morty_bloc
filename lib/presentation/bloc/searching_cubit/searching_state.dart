part of 'searching_cubit.dart';

abstract class SearchingState extends Equatable {
  const SearchingState();

  @override
  List<Object> get props => [];
}

class IsSearchingState extends SearchingState {}

class IsNotSearchingState extends SearchingState {}
