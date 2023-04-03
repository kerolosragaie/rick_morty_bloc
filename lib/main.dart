import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rick_morty_bloc/app_router.dart';
import 'package:rick_morty_bloc/presentation/screens/screens.dart';
import 'core/theme/app_theme.dart';

void main() {
  runApp(RickAndMorty(
    appRouter: AppRouter(),
  ));
}

class RickAndMorty extends StatelessWidget {
  const RickAndMorty({super.key, required this.appRouter});

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
      ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rick and Morty',
      theme: appTheme,
      onGenerateRoute: appRouter.generateRoute,
      home: const CharactersScreen(),
    );
  }
}
