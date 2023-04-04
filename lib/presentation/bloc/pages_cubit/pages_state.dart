part of 'pages_cubit.dart';

abstract class PagesState extends Equatable {
  const PagesState();

  @override
  List<Object> get props => [];
}

class PagesInitial extends PagesState {}

class PagesLoaded extends PagesState {
  final int pages;

  const PagesLoaded({required this.pages});
}

class ErrorPagesState extends PagesState {
  final String message;

  const ErrorPagesState({required this.message});
  @override
  List<Object> get props => [message];
}
