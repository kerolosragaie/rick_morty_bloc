import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rick_morty_bloc/data/models/character_model/result_char.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/routes.dart';
import '../../../core/util/loading_indicator.dart';

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
        onTap: () {
          Navigator.pushNamed(context, CHARACTERS_SCREEN_DETAILS,
              arguments: {'character': resultChar});
        },
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
                  ? CachedNetworkImage(
                      fit: BoxFit.fill,
                      imageUrl: resultChar.image!,
                      placeholder: (context, url) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: LoadingIndicators.ballScale(),
                      ),
                      errorWidget: (context, url, error) => Image.asset(
                        "assets/images/error.gif",
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.fill,
                      ),
                    )
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
