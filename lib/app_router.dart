import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty_bloc/core/constants/strings.dart';
import 'package:rick_morty_bloc/data/repositories/character_repository.dart';
import 'package:rick_morty_bloc/data/services/character_services.dart';
import 'package:rick_morty_bloc/presentation/bloc/cubit/characters_cubit.dart';
import 'package:rick_morty_bloc/presentation/screens/screens.dart';

class AppRouter {
  late CharacterRepository characterRepository;
  late CharactersCubit charactersCubit;

  AppRouter() {
    characterRepository = CharacterRepository(CharacterServices());
    charactersCubit = CharactersCubit(characterRepository);
  }
  Route? generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case CHARACTERS_SCREEN:
        {
          // CharactersCubit charactersCubit = CharactersCubit(characterRepository);
          return MaterialPageRoute(
            builder: (_) => BlocProvider(
              create: (context) => CharactersCubit(characterRepository),
              child: const CharactersScreen(),
            ),
          );
        }
    }
    return null;
  }
}
