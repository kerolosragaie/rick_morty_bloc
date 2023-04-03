import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty_bloc/presentation/bloc/characters/characters_bloc.dart';

import '../widgets/character_item.dart';

class CharactersScreen extends StatelessWidget {
  const CharactersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("test"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<CharactersBloc, CharactersState>(
          builder: (context, state) {
            if (state is LoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is LoadedCharactersState) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 2 / 3,
                                crossAxisSpacing: 1,
                                mainAxisSpacing: 1),
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        padding: EdgeInsets.zero,
                        itemCount: state.characters.length,
                        itemBuilder: (ctx, index) {
                          return CharacterItem(
                            resultChar: state.characters[index],
                          );
                        }),
                  ],
                ),
              );
            } else if (state is ErrorState) {
              return Text(state.message.toString());
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
