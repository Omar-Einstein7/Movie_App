import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/bloc/generic_data_cubit.dart';
import 'package:movie_app/common/bloc/generic_data_state.dart';
import 'package:movie_app/common/widgets/movies/movie_card.dart';
import 'package:movie_app/core/entity/keyword.dart';
import 'package:movie_app/domain/movie/entities/movie.dart';
import 'package:movie_app/domain/movie/usecases/get_reommendation_movie.dart';
import 'package:movie_app/domain/tv/usecases/get_keywords.dart';
import 'package:movie_app/service_locator.dart';

class TVKeywords extends StatelessWidget {
  final int tvId;
  const TVKeywords({super.key, required this.tvId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => GenericDataCubit()
          ..getData<List<KeywordEntity>>(sl<GetTVKeywordsUseCase>(),
              params: tvId),
        child: BlocBuilder<GenericDataCubit, GenericDataState>(
            builder: (context, state) {
          if (state is DataLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is DataLoaded) {
            List<KeywordEntity> keywords = state.data;
            return Wrap(
              spacing: 5,
              children: keywords
                  .map((item) => Chip(label: Text(item.name!)))
                  .toList(),
            );
          }
          if (state is FailureLoadData) {
            return Text(state.errorMessage);
          }
          return Container();
        }));
  }
}
