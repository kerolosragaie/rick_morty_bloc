import 'package:flutter/material.dart';
import 'package:rick_morty_bloc/data/models/character_model/result_char.dart';
import 'package:rick_morty_bloc/data/services/character_services.dart';

class CharactersScreen extends StatelessWidget {
  CharactersScreen({super.key});

  final CharacterSeervices characterSeervices = CharacterSeervices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("test"),
      ),
      body: SizedBox(
        height: 100,
        width: 200,
        child: FutureBuilder(
          future: characterSeervices.getAllCharacters(),
          builder:
              (BuildContext context, AsyncSnapshot<List<ResultChar>> snapshot) {
            if (snapshot.hasData) {
              List<ResultChar> characters = snapshot.data!;
              return ListView(
                children: characters
                    .map(
                      (ResultChar post) => ListTile(
                        title: Text(post.name!),
                      ),
                    )
                    .toList(),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
