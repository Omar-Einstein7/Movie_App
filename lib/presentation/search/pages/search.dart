import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/widgets/appbar/app_bar.dart';
import 'package:movie_app/presentation/search/bloc/search_cubit.dart';
import 'package:movie_app/presentation/search/bloc/selectable_option_cubit.dart';
import 'package:movie_app/presentation/search/widgets/search_content.dart';
import 'package:movie_app/presentation/search/widgets/search_field.dart';
import 'package:movie_app/presentation/search/widgets/search_option.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        title: Text("Search"),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => SelectableOptionCubit()),
          BlocProvider(create: (context) => SearchCubit())
        ],
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SearchField(),
              const SizedBox(
                height: 16,
              ),
              SearchOption(),
              const SizedBox(
                height: 16,
              ),
              Expanded(child: SearchContent())
            ],
          ),
        ),
      ),
    );
  }
}
