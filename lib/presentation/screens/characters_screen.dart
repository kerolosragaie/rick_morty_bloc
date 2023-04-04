import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty_bloc/core/util/loading_indicator.dart';
import 'package:rick_morty_bloc/presentation/bloc/characters/characters_bloc.dart';

import '../widgets/app_bar.dart';
import '../widgets/characters_screen/character_list.dart';
import '../widgets/error_widget.dart';

class CharactersScreen extends StatelessWidget {
  const CharactersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              BlocProvider.of<CharactersBloc>(context)
                  .add(GetAllCharactersEvent());
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<CharactersBloc, CharactersState>(
          builder: (context, state) {
            if (state is LoadingState) {
              return LoadingIndicators.ballSpinFadeLoader(context: context);
            } else if (state is LoadedCharactersState) {
              return CharactersList(characters: state.characters);
            } else if (state is ErrorState) {
              return ErrorGifWidget(
                message: state.message,
              );
            }
            return LoadingIndicators.ballSpinFadeLoader(context: context);
          },
        ),
      ),
    );
  }
}
