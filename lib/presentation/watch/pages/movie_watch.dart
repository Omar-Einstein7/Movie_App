import 'package:flutter/material.dart';
import 'package:movie_app/common/widgets/appbar/app_bar.dart';
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
      appBar: BasicAppbar(
        hideBack: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VideoPlayer(id: movieEntity.id!),
            SizedBox(
              height: 12,
            ),
            VideoTitle(title: movieEntity.title!),
            SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                VideoReleaseDate(releaseDate: movieEntity.releaseDate!),
                VideoVoteAverage(voteAverage: movieEntity.voteAverage!),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            VideoOverview(overiew: movieEntity.overview!),
            SizedBox(
              height: 16,
            ),
            RecommendationMovies(movieId: movieEntity.id!),
            SizedBox(
              height: 16,
            ),
            SimilarMovies(movieId: movieEntity.id!)
          ],
        ),
      ),
    );
  }
}
