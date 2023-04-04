part of 'main.dart';

class AppRouter {
  Route? generateRoute(RouteSettings routeSettings) {
    Map args = routeSettings.arguments as Map;
    switch (routeSettings.name) {
      case CHARACTERS_SCREEN:
        {
          return MaterialPageRoute(
            builder: (_) => const CharactersScreen(),
          );
        }
      case CHARACTERS_SCREEN_DETAILS:
        {
          return MaterialPageRoute(
            builder: (_) => CharacterDetailsScreen(
              args: args,
            ),
          );
        }
    }
    return null;
  }
}
