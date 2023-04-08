import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_pagination/number_pagination.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/util/loading_indicator.dart';
import '../../bloc/characters/characters_bloc.dart';
import '../../bloc/pages_cubit/pages_cubit.dart';

class NumberPaginationWidget extends StatelessWidget {
  final Function funct;
  const NumberPaginationWidget({super.key, required this.funct});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: BlocBuilder<PagesCubit, PagesState>(
        builder: (context, state) {
          if (state is PagesLoaded) {
            return NumberPagination(
              onPageChanged: (int pageNumber) {
                funct(pageNumber);
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
    );
  }
}
