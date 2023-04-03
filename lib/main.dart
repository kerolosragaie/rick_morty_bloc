import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rick_morty_bloc/app_router.dart';
import 'package:rick_morty_bloc/core/constants/app_colors.dart';
import 'package:rick_morty_bloc/presentation/screens/screens.dart';

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
      theme: ThemeData(
        primarySwatch: AppColors.primary,
        secondaryHeaderColor: AppColors.secondary,
      ),
      onGenerateRoute: appRouter.generateRoute,
      home: const CharactersScreen(),
    );
  }
}
