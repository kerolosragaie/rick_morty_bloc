import 'package:flutter/material.dart';
import 'package:rick_morty_bloc/data/models/character_model/result_char.dart';

import '../../core/constants/app_colors.dart';

class CharacterItem extends StatelessWidget {
  final ResultChar resultChar;
  const CharacterItem({super.key, required this.resultChar});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
          color: AppColors.secondary, borderRadius: BorderRadius.circular(8)),
      child: GestureDetector(
        onTap: () {},
        child: GridTile(
          footer: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            color: Colors.black45,
            alignment: Alignment.bottomCenter,
            child: Text(
              resultChar.name!,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 20,
                  height: 1.3,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          child: Hero(
            tag: resultChar.id!,
            child: Container(
              color: Colors.white,
              child: resultChar.image!.isNotEmpty
                  ? FadeInImage.assetNetwork(
                      width: double.infinity,
                      height: double.infinity,
                      placeholder: "assets/images/loading.gif",
                      fit: BoxFit.fill,
                      image: resultChar.image!)
                  : Image.asset(
                      "assets/images/error.gif",
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.fill,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
