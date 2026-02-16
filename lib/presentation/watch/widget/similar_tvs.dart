import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/bloc/generic_data_cubit.dart';
import 'package:movie_app/common/bloc/generic_data_state.dart';
import 'package:movie_app/common/widgets/tv/tv_card.dart';
import 'package:movie_app/domain/tv/entities/tv.dart';
import 'package:movie_app/domain/tv/usecases/get_similar_tvs.dart';

import 'package:movie_app/service_locator.dart';

class SimilarTvs extends StatelessWidget {
  final int tvId;
  const SimilarTvs({super.key, required this.tvId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => GenericDataCubit()
          ..getData<List<TVEntity>>(sl<GetSimilarTvsUseCase>(), params: tvId),
        child: BlocBuilder<GenericDataCubit, GenericDataState>(
            builder: (context, state) {
          if (state is DataLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is DataLoaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Similar",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: 300,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return TvCard(tvEntity: state.data[index]);
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                            width: 10,
                          ),
                      itemCount: state.data.length),
                ),
              ],
            );
          }
          if (state is FailureLoadData) {
            return Text(state.errorMessage);
          }
          return Container();
        }));
  }
}
