import 'package:flutter/material.dart';
import 'package:rick_morty_bloc/core/constants/app_colors.dart';
import 'package:rick_morty_bloc/data/models/character_model/result_char.dart';
import 'package:rick_morty_bloc/presentation/widgets/character_details_screen/character_info.dart';
import 'package:rick_morty_bloc/presentation/widgets/character_details_screen/divider_widget.dart';

class CharacterDetailsScreen extends StatefulWidget {
  final Map args;
  const CharacterDetailsScreen({
    Key? key,
    required this.args,
  }) : super(key: key);

  @override
  State<CharacterDetailsScreen> createState() => _CharacterDetailsScreenState();
}

class _CharacterDetailsScreenState extends State<CharacterDetailsScreen> {
  late ResultChar character;
  @override
  void initState() {
    character = widget.args['character'] as ResultChar;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // We do not need AppBar Here
      backgroundColor: AppColors.secondary,

      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: const EdgeInsets.fromLTRB(14.0, 14.0, 14.0, 0.0),
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CharacterInfo(
                          title: 'Created : ',
                          value:
                              "${character.created!.day}/${character.created!.month}/${character.created!.year}"),
                      const DividerWidget(),
                      CharacterInfo(
                          title: 'Status : ', value: character.status!),
                      const DividerWidget(),
                      CharacterInfo(
                          title: 'Species : ', value: character.species!),
                      const DividerWidget(),
                      CharacterInfo(
                          title: 'Gender : ', value: character.gender!),
                      const DividerWidget(),
                      CharacterInfo(
                          title: 'Location : ',
                          value: character.location!.name!),
                      const DividerWidget(),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 350.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSliverAppBar() {
    return SliverAppBar(
        expandedHeight: 500.0,
        pinned: true,
        stretch: true,
        backgroundColor: AppColors.primary,
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          title: Text(
            character.name!,
            style: const TextStyle(color: AppColors.text),
          ),
          background: Hero(
            tag: character.id!,
            child: Image.network(
              character.image!,
              fit: BoxFit.cover,
            ),
          ),
        ));
  }
}
