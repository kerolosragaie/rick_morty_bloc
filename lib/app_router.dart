part of 'main.dart';

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
