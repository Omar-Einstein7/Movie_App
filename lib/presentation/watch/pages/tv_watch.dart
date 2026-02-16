import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/common/widgets/loading/app_shimmer.dart';
import 'package:movie_app/core/config/assets/app_image.dart';
import 'package:movie_app/domain/tv/entities/tv.dart';
import 'package:movie_app/presentation/watch/widget/recommendation_tvs.dart';
import 'package:movie_app/presentation/watch/widget/similar_tvs.dart';
import 'package:movie_app/presentation/watch/widget/tv_keywords.dart';
import 'package:movie_app/presentation/watch/widget/video_overview.dart';
import 'package:movie_app/presentation/watch/widget/video_player.dart';

import 'package:movie_app/presentation/watch/widget/video_title.dart';
import 'package:movie_app/presentation/watch/widget/video_vote_average.dart';

class TvWatchPage extends StatelessWidget {
  final TVEntity tvEntity;
  const TvWatchPage({required this.tvEntity, super.key});

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
                  tvEntity.posterPath != null && tvEntity.posterPath!.isNotEmpty
                      ? Hero(
                          tag: 'tv_poster_${tvEntity.id}',
                          child: CachedNetworkImage(
                            imageUrl:
                                AppImage.movieImageBasePath +
                                tvEntity.posterPath!,
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
                              Icons.tv,
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
                  VideoTitle(title: tvEntity.name!),
                  const SizedBox(height: 12),
                  TVKeywords(tvId: tvEntity.id!),
                  const SizedBox(height: 12),
                  VideoVoteAverage(voteAverage: tvEntity.voteAverage!),
                  const SizedBox(height: 24),
                  Text(
                    'Overview',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  VideoOverview(overiew: tvEntity.overview!),
                  const SizedBox(height: 24),
                  Text(
                    'Trailer',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  VideoPlayer(id: tvEntity.id!),
                  const SizedBox(height: 24),
                  Text(
                    'Recommendations',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  RecommendationTVs(tvId: tvEntity.id!),
                  const SizedBox(height: 24),
                  Text(
                    'Similar TV Shows',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  SimilarTvs(tvId: tvEntity.id!),
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
