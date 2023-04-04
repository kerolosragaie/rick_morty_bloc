import 'package:flutter/material.dart';

import 'character_item.dart';

class CharactersList extends StatelessWidget {
  final List<dynamic> characters;
  const CharactersList({super.key, required this.characters});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 3,
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 1),
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: characters.length,
              itemBuilder: (ctx, index) {
                return CharacterItem(
                  resultChar: characters[index],
                );
              }),
        ],
      ),
    );
  }
}
