import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/common/widgets/appbar/app_bar.dart';
import 'package:movie_app/core/config/assets/app_vectors.dart';
import 'package:movie_app/presentation/home/widgets/category_text.dart';
import 'package:movie_app/presentation/home/widgets/now_playing_movies.dart';
import 'package:movie_app/presentation/home/widgets/popular_tv.dart';
import 'package:movie_app/presentation/home/widgets/trending_movies.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        hideBack: true,
        title: SvgPicture.asset(
          AppVectors.logo,
          height: 40,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TrendingMovies(),
            SizedBox(height: 24),
            CategoryText(title: "Now Playing"),
            SizedBox(height: 16),
            NowPlayingMovies(),
            SizedBox(height: 24),
            CategoryText(title: "Popular TV"),
            SizedBox(height: 16),
            PopularTV(),
            SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
