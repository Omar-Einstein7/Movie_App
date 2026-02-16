import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/common/helper/navigation/app_navigation.dart';
import 'package:movie_app/common/widgets/loading/app_shimmer.dart';
import 'package:movie_app/domain/movie/entities/movie.dart';
import 'package:movie_app/presentation/watch/pages/movie_watch.dart';

class MovieCard extends StatelessWidget {
  final MovieEntity movieEntity;
  const MovieCard({required this.movieEntity, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppNavigator.push(context, MovieWatchPage(movieEntity: movieEntity));
      },
      child: Container(
        width: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Theme.of(context).colorScheme.surface,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.2),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias, // Ensures child respects border radius
        child: Stack(
          children: [
            // Background Image
            Positioned.fill(
              child: movieEntity.providePosterPath().isNotEmpty
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
                              Icons.error_outline,
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                          ),
                        ),
                      ),
                    )
                  : Container(
                      color: Theme.of(context).colorScheme.secondaryContainer,
                      child: Center(
                        child: Icon(
                          Icons.movie,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                    ),
            ),
            // Gradient Overlay
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withValues(alpha: 0.8),
                      Colors.black,
                    ],
                    stops: const [0.0, 0.6, 1.0],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      movieEntity.title!,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 2,
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(
                          Icons.star_rounded,
                          size: 16,
                          color: Colors.amber,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          movieEntity.voteAverage!.toStringAsFixed(1),
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.white70,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
