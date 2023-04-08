import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty_bloc/core/constants/app_colors.dart';
import 'package:rick_morty_bloc/presentation/bloc/searching_cubit/searching_cubit.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final Function? callBackSearch;
  const AppbarWidget({
    super.key,
    this.title = "Characters",
    this.actions,
    this.callBackSearch,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchingCubit, SearchingState>(
      builder: (context, state) {
        if (state is IsSearchingState) {
          return AppBar(
            backgroundColor: AppColors.primary,
            title: TextField(
              onChanged: (value) {
                callBackSearch!(value);
              },
              cursorColor: Colors.white,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: 'Search',
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
                suffixIcon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  BlocProvider.of<SearchingCubit>(context).call(false);
                },
                icon: const Icon(
                  Icons.close,
                  color: Colors.white,
                ),
              ),
            ],
          );
        } else if (state is IsNotSearchingState) {
          return AppBar(
            backgroundColor: AppColors.primary,
            title: Text(title),
            actions: actions ?? [],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
