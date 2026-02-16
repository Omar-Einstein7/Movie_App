import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/bloc/generic_data_cubit.dart';
import 'package:movie_app/common/bloc/generic_data_state.dart';
import 'package:movie_app/common/widgets/movies/movie_card.dart';
import 'package:movie_app/domain/movie/entities/movie.dart';
import 'package:movie_app/domain/movie/usecases/get_reommendation_movie.dart';
import 'package:movie_app/service_locator.dart';

class RecommendationMovies extends StatelessWidget {
  final int movieId;
  const RecommendationMovies({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            GenericDataCubit()..getData<List<MovieEntity>>(sl<GetReommendationMovieUseCase>(), params: movieId),
        child:
            BlocBuilder<GenericDataCubit, GenericDataState>(
                builder: (context, state) {
          if (state is DataLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is DataLoaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Recommendation",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16,),
                SizedBox(
                  height: 300,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return MovieCard(movieEntity: state.data[index]);
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
