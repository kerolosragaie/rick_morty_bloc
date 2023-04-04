import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_pagination/number_pagination.dart';
import 'package:rick_morty_bloc/core/constants/app_colors.dart';
import 'package:rick_morty_bloc/core/util/loading_indicator.dart';
import 'package:rick_morty_bloc/presentation/bloc/characters/characters_bloc.dart';
import 'package:rick_morty_bloc/presentation/bloc/pages_cubit/pages_cubit.dart';

import '../widgets/app_bar.dart';
import '../widgets/characters_screen/character_list.dart';
import '../widgets/error_widget.dart';

class CharactersScreen extends StatelessWidget {
  const CharactersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int pageNum = 0;
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
                  .add(GetAllCharactersEvent(page: pageNum));
            },
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
            width: double.infinity,
            child: BlocBuilder<PagesCubit, PagesState>(
              builder: (context, state) {
                if (state is PagesLoaded) {
                  return NumberPagination(
                    onPageChanged: (int pageNumber) {
                      pageNum = pageNumber;
                      BlocProvider.of<CharactersBloc>(context)
                          .add(GetAllCharactersEvent(page: pageNumber));
                    },
                    threshold: 4,
                    pageTotal: state.pages,
                    pageInit: 1,
                    colorPrimary: Colors.white,
                    colorSub: AppColors.secondary,
                  );
                } else if (state is ErrorPagesState) {
                  return NumberPagination(
                    onPageChanged: (int pageNumber) {},
                    threshold: 4,
                    pageTotal: 1,
                    pageInit: 1,
                    colorPrimary: Colors.white,
                    colorSub: AppColors.secondary,
                  );
                }
                return LoadingIndicators.ballPulse();
              },
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: BlocBuilder<CharactersBloc, CharactersState>(
                builder: (context, state) {
                  if (state is LoadingState) {
                    return LoadingIndicators.ballSpinFadeLoader(
                        context: context);
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
          ),
        ],
      ),
    );
  }
}
