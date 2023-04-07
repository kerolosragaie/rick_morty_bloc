import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty_bloc/core/constants/app_colors.dart';
import 'package:rick_morty_bloc/core/util/loading_indicator.dart';
import 'package:rick_morty_bloc/data/models/character_model/result_char.dart';
import 'package:rick_morty_bloc/presentation/bloc/eposides_cubit/eposides_cubit.dart';
import 'package:rick_morty_bloc/presentation/widgets/character_details_screen/character_info.dart';
import 'package:rick_morty_bloc/presentation/widgets/character_details_screen/divider_widget.dart';
import '../widgets/character_details_screen/character_eposides_item.dart';
import '../widgets/error_widget.dart';

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
  late String allEpisodesValue;
  @override
  void initState() {
    character = widget.args['character'] as ResultChar;
    if (character.episode!.isEmpty) {
      allEpisodesValue = "No episodes found!";
    } else if (character.episode!.length == 1) {
      allEpisodesValue = "${character.episode!.length} episode";
    } else {
      allEpisodesValue = "${character.episode!.length} episodes";
    }
    SchedulerBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<EposidesCubit>(context)
          .getAllEposides(character.episode!.map((e) => e.toString()).toList());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      CharacterInfo(
                          title: 'Total Episodes : ', value: allEpisodesValue),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.17,
                        width: double.infinity,
                        child: BlocBuilder<EposidesCubit, EposidesState>(
                          builder: (context, state) {
                            if (state is EposidesLoadingState) {
                              return LoadingIndicators.ballPulseSync();
                            } else if (state is EposidesErrorState) {
                              return ErrorGifWidget(
                                message: state.message,
                              );
                            } else if (state is EposidesLoadedState) {
                              return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: state.allEposides.length,
                                itemBuilder: (_, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: CharacterEposidesItem(
                                      resultEpisode: state.allEposides[index],
                                    ),
                                  );
                                },
                              );
                            }
                            return LoadingIndicators.ballPulseSync();
                          },
                        ),
                      ),
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
