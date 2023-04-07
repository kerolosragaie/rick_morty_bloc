part of 'eposides_cubit.dart';

abstract class EposidesState extends Equatable {
  const EposidesState();

  @override
  List<Object> get props => [];
}

class EposidesInitial extends EposidesState {}

class EposidesLoadingState extends EposidesState {}

class EposidesLoadedState extends EposidesState {
  final List<ResultEpisode> allEposides;

  const EposidesLoadedState({required this.allEposides});
  @override
  List<Object> get props => [allEposides];
}

class EposidesErrorState extends EposidesState {
  final String message;
  const EposidesErrorState({
    required this.message,
  });
  @override
  List<Object> get props => [message];
}
