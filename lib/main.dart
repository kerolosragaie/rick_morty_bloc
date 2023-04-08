import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty_bloc/presentation/bloc/characters/characters_bloc.dart';
import 'package:rick_morty_bloc/presentation/bloc/eposides_cubit/eposides_cubit.dart';
import 'package:rick_morty_bloc/presentation/bloc/pages_cubit/pages_cubit.dart';
import 'package:rick_morty_bloc/presentation/bloc/searching_cubit/searching_cubit.dart';
import 'package:rick_morty_bloc/presentation/screens/character_details_screen.dart';
import 'package:rick_morty_bloc/presentation/screens/screens.dart';
import 'core/constants/routes.dart';
import 'core/theme/app_theme.dart';
import 'injection_container.dart' as di;

part 'app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(RickAndMorty(
    appRouter: AppRouter(),
  ));
}

class RickAndMorty extends StatelessWidget {
  final AppRouter appRouter;

  const RickAndMorty({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
      ),
    );

    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => di.sl<CharactersBloc>()
              ..add(const GetAllCharactersEvent(page: 0))),
        BlocProvider(create: (_) => di.sl<PagesCubit>()..getPages()),
        BlocProvider(create: (_) => di.sl<EposidesCubit>()),
        BlocProvider(create: (_) => di.sl<SearchingCubit>()..call(false)),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Rick and Morty',
        theme: appTheme,
        onGenerateRoute: appRouter.generateRoute,
        home: const CharactersScreen(),
      ),
    );
  }
}
