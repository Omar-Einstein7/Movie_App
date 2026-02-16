import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/helper/navigation/app_navigation.dart';
import 'package:movie_app/common/widgets/loading/app_shimmer.dart';
import 'package:movie_app/core/config/assets/app_image.dart';
import 'package:movie_app/presentation/home/bloc/get_trendings_cubit.dart';
import 'package:movie_app/presentation/home/bloc/get_trendings_state.dart';
import 'package:movie_app/presentation/watch/pages/movie_watch.dart';

class TrendingMovies extends StatelessWidget {
  const TrendingMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TrendingsCubit()..getTrendingMovies(),
      child: BlocBuilder<TrendingsCubit, TrendingsState>(
        builder: (context, state) {
          if (state is TrendingMoviesLoading) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: AppShimmer(
                width: double.infinity,
                height: 400,
                radius: 16,
              ),
            );
          }
          if (state is TrendingMoviesLoaded) {
            return SizedBox(
              height: 400,
              child: PageView.builder(
                itemCount: state.movies.length,
                controller: PageController(viewportFraction: 0.9),
                itemBuilder: (context, index) {
                  final movie = state.movies[index];
                  final imageUrl = movie.backdropPath != null
                      ? AppImage.movieImageBasePath + movie.backdropPath!
                      : movie.providePosterPath();
                  return GestureDetector(
                    onTap: () {
                      AppNavigator.push(
                        context,
                        MovieWatchPage(movieEntity: movie),
                      );
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Theme.of(context).colorScheme.surface,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.2),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            CachedNetworkImage(
                              imageUrl: imageUrl,
                              fit: BoxFit.cover,
                              placeholder: (context, url) => const AppShimmer(
                                width: double.infinity,
                                height: double.infinity,
                                radius: 0,
                              ),
                              errorWidget: (context, url, error) => Container(
                                color: Theme.of(
                                  context,
                                ).colorScheme.secondaryContainer,
                                child: const Icon(Icons.error),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [
                                    Colors.black.withValues(alpha: 0.9),
                                    Colors.transparent,
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    movie.title ?? 'Unknown',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      shadows: [
                                        Shadow(
                                          blurRadius: 10,
                                          color: Colors.black,
                                          offset: Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 20,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        movie.voteAverage?.toStringAsFixed(1) ??
                                            '0.0',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          }
          if (state is FailureLoadTrendingMovies) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(state.errorMessage),
            );
          }
          return Container();
        },
      ),
    );
  }
}
