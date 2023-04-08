import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty_bloc/core/util/loading_indicator.dart';
import 'package:rick_morty_bloc/presentation/bloc/characters/characters_bloc.dart';
import 'package:rick_morty_bloc/presentation/bloc/searching_cubit/searching_cubit.dart';
import '../../data/models/character_model/result_char.dart';
import '../widgets/app_bar.dart';
import '../widgets/characters_screen/character_list.dart';
import '../widgets/characters_screen/number_pagination_widget.dart';
import '../widgets/error_widget.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  int _pageNum = 0;
  bool _isSearching = false;
  List<ResultChar> _allChars = [];
  List<ResultChar> _resultChars = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        callBackSearch: (value) {
          _resultChars = _runFilter(value);
          BlocProvider.of<CharactersBloc>(context)
              .add(GetAllCharactersEvent(page: _pageNum));
        },
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              _isSearching = true;
              BlocProvider.of<SearchingCubit>(context).call(_isSearching);
              _isSearching = false;
            },
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              _resultChars = [];
              BlocProvider.of<CharactersBloc>(context)
                  .add(GetAllCharactersEvent(page: _pageNum));
            },
          ),
        ],
      ),
      body: Column(
        children: [
          NumberPaginationWidget(
            funct: (pageNumber) {
              _pageNum = pageNumber;
              _resultChars = [];
            },
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
                    _allChars = List.from(state.characters);
                    if (_resultChars.isNotEmpty) {
                      return CharactersList(characters: _resultChars);
                    } else {
                      return CharactersList(characters: state.characters);
                    }
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

  List<ResultChar> _runFilter(String enteredKeyword) {
    List<ResultChar> results = [];
    if (enteredKeyword.isEmpty) {
      results = _allChars;
    } else {
      results = _allChars
          .where((char) => char.name
              .toString()
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    return results;
  }
}
