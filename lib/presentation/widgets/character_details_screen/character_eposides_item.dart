import 'package:flutter/material.dart';
import 'package:rick_morty_bloc/core/constants/app_colors.dart';
import 'package:rick_morty_bloc/data/models/episode_model/result_episode.dart';

class CharacterEposidesItem extends StatefulWidget {
  final ResultEpisode resultEpisode;
  const CharacterEposidesItem({super.key, required this.resultEpisode});

  @override
  State<CharacterEposidesItem> createState() => _CharacterEposidesItemState();
}

class _CharacterEposidesItemState extends State<CharacterEposidesItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: MediaQuery.of(context).size.width / 2.2,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.text),
          borderRadius: BorderRadius.circular(20.0),
        ),
        padding: const EdgeInsets.all(6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Name: ${widget.resultEpisode.name}",
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w900,
              ),
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              maxLines: 2,
            ),
            Text(
              "Air date: ${widget.resultEpisode.airDate}",
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              maxLines: 2,
            ),
            Text(
              "Episode: ${widget.resultEpisode.episode}",
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              maxLines: 2,
            ),
          ],
        ),
      ),
    );
  }
}
