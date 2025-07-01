import 'package:flutter/material.dart';
import 'package:movie_app/common/widgets/appbar/app_bar.dart';
import 'package:movie_app/domain/movie/entities/movie.dart';
import 'package:movie_app/domain/tv/entities/tv.dart';
import 'package:movie_app/presentation/watch/widget/recommendation_movies.dart';
import 'package:movie_app/presentation/watch/widget/recommendation_tvs.dart';
import 'package:movie_app/presentation/watch/widget/similar_movies.dart';
import 'package:movie_app/presentation/watch/widget/similar_tvs.dart';
import 'package:movie_app/presentation/watch/widget/tv_keywords.dart';
import 'package:movie_app/presentation/watch/widget/video_overview.dart';
import 'package:movie_app/presentation/watch/widget/video_player.dart';
import 'package:movie_app/presentation/watch/widget/video_released_date.dart';
import 'package:movie_app/presentation/watch/widget/video_title.dart';
import 'package:movie_app/presentation/watch/widget/video_vote_average.dart';

class TvWatchPage extends StatelessWidget {
  final TVEntity tvEntity;
  const TvWatchPage({required this.tvEntity, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        hideBack: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VideoPlayer(id: tvEntity.id!),
            SizedBox(
              height: 16,
            ),
            VideoTitle(title: tvEntity.name!),
            const SizedBox(
              height: 16,
            ),
            TVKeywords(tvId: tvEntity.id!),
            SizedBox(
              height: 16,
            ),
            VideoVoteAverage(voteAverage: tvEntity.voteAverage!),
            SizedBox(
              height: 16,
            ),
            VideoOverview(overiew: tvEntity.overview!),
            SizedBox(
              height: 16,
            ),
            RecommendationTVs(tvId: tvEntity.id!),
            SizedBox(
              height: 16,
            ),
            SimilarTvs(tvId: tvEntity.id!)
          ],
        ),
      ),
    );
  }
}
