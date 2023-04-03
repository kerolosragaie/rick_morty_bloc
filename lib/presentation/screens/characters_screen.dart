import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty_bloc/data/models/character_model/character_model.dart';
import 'package:debug_logger/debug_logger.dart';
import 'package:rick_morty_bloc/presentation/widgets/character_item.dart';

import '../bloc/cubit/characters_cubit.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  late CharacterModel characterModel;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      BlocProvider.of<CharactersCubit>(context).getAllCharacters();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("test"),
      ),
      body: BlocBuilder<CharactersCubit, CharactersState>(
          builder: (context, state) {
        if (state is CharacterLoaded) {
          characterModel = (state).characterModel!;
          DebugLogger.debug(characterModel.toString());
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
                    itemCount: characterModel.results!.length,
                    itemBuilder: (ctx, index) {
                      return CharacterItem(
                        resultChar: characterModel.results![index],
                      );
                    }),
              ],
            ),
          );
        } else {
          return Container(
            margin: const EdgeInsets.all(10),
            child: Column(
              children: const [
                Image(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/images/error.gif"),
                ),
                Text(
                  "Check your connection and try again.",
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          );
        }
      }),
    );
  }
}
