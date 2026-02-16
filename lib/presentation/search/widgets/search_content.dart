import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/widgets/movies/movie_card.dart';
import 'package:movie_app/common/widgets/tv/tv_card.dart';
import 'package:movie_app/presentation/search/widgets/grid_shimmer.dart';
import 'package:movie_app/presentation/search/bloc/search_cubit.dart';
import 'package:movie_app/presentation/search/bloc/search_state.dart';

class SearchContent extends StatelessWidget {
  const SearchContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchLoading) {
          return const GridShimmer();
        }
        if (state is MoviesLoaded) {
          return GridView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: state.movies.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200, // Responsive grid item width
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.7,
            ),
            itemBuilder: (context, index) {
              return MovieCard(movieEntity: state.movies[index]);
            },
          );
        }
        if (state is TVsLoaded) {
          return GridView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: state.tvs.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200, // Responsive grid item width
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.7,
            ),
            itemBuilder: (context, index) {
              return TvCard(tvEntity: state.tvs[index]);
            },
          );
        }
        if (state is SearchFailure) {
          return Center(child: Text(state.errorMessage));
        }
        return Container();
      },
    );
  }
}
