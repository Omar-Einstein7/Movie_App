import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/presentation/search/bloc/search_cubit.dart';
import 'package:movie_app/presentation/search/bloc/selectable_option_cubit.dart';
import 'package:movie_app/presentation/search/widgets/selectable_opiton.dart';

class SearchOption extends StatelessWidget {
  const SearchOption({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectableOptionCubit, SearchType>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SelectableOpiton(
                title: "Movie",
                isSelected: context.read<SelectableOptionCubit>().state ==
                    SearchType.movie,
                onTap: () {
                  context.read<SelectableOptionCubit>().seletMovie();
                  context.read<SearchCubit>().search(
                      context.read<SearchCubit>().textEditingController.text,
                      context.read<SelectableOptionCubit>().state);
                }),
            SizedBox(
              width: 16,
            ),
            SelectableOpiton(
                title: "TV",
                isSelected: context.read<SelectableOptionCubit>().state ==
                    SearchType.tv,
             onTap: () {
                  context.read<SelectableOptionCubit>().seletTV();
                  context.read<SearchCubit>().search(
                      context.read<SearchCubit>().textEditingController.text,
                      context.read<SelectableOptionCubit>().state);
                })
          ],
        );
      },
    );
  }
}
