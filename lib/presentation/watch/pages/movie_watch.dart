import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/common/widgets/loading/app_shimmer.dart';
import 'package:movie_app/domain/movie/entities/movie.dart';
import 'package:movie_app/presentation/watch/widget/recommendation_movies.dart';
import 'package:movie_app/presentation/watch/widget/similar_movies.dart';
import 'package:movie_app/presentation/watch/widget/video_overview.dart';
import 'package:movie_app/presentation/watch/widget/video_player.dart';
import 'package:movie_app/presentation/watch/widget/video_released_date.dart';
import 'package:movie_app/presentation/watch/widget/video_title.dart';
import 'package:movie_app/presentation/watch/widget/video_vote_average.dart';

class MovieWatchPage extends StatelessWidget {
  final MovieEntity movieEntity;
  const MovieWatchPage({required this.movieEntity, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  movieEntity.providePosterPath().isNotEmpty
                      ? Hero(
                          tag: 'movie_poster_${movieEntity.id}',
                          child: CachedNetworkImage(
                            imageUrl: movieEntity.providePosterPath(),
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
                              child: Center(
                                child: Icon(
                                  Icons.broken_image,
                                  size: 50,
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onSurface,
                                ),
                              ),
                            ),
                          ),
                        )
                      : Container(
                          color: Theme.of(
                            context,
                          ).colorScheme.secondaryContainer,
                          child: Center(
                            child: Icon(
                              Icons.movie,
                              size: 50,
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                          ),
                        ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withValues(alpha: 0.7),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VideoTitle(title: movieEntity.title!),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      VideoReleaseDate(releaseDate: movieEntity.releaseDate!),
                      const SizedBox(width: 16),
                      VideoVoteAverage(voteAverage: movieEntity.voteAverage!),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Overview',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  VideoOverview(overiew: movieEntity.overview!),
                  const SizedBox(height: 24),
                  Text(
                    'Trailer',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  VideoPlayer(id: movieEntity.id!),
                  const SizedBox(height: 24),
                  Text(
                    'Recommendations',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  RecommendationMovies(movieId: movieEntity.id!),
                  const SizedBox(height: 24),
                  Text(
                    'Similar Movies',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  SimilarMovies(movieId: movieEntity.id!),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
