import 'package:flutter/material.dart';
import 'package:rick_morty_bloc/core/constants/routes.dart';
import 'package:rick_morty_bloc/presentation/screens/screens.dart';

class AppRouter {
  Route? generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case CHARACTERS_SCREEN:
        {
          return MaterialPageRoute(
            builder: (_) => const CharactersScreen(),
          );
        }
    }
    return null;
  }
}
