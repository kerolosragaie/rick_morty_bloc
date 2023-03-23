import 'package:flutter_bloc/flutter_bloc.dart';

part 'characters_cubit_state.dart';

class CharactersCubitCubit extends Cubit<CharactersCubitState> {
  CharactersCubitCubit() : super(CharactersCubitInitial());
}
