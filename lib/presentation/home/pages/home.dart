import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/common/helper/navigation/app_navigation.dart';
import 'package:movie_app/common/widgets/appbar/app_bar.dart';
import 'package:movie_app/core/config/assets/app_vectors.dart';
import 'package:movie_app/presentation/home/widgets/category_text.dart';
import 'package:movie_app/presentation/home/widgets/now_playing_movies.dart';
import 'package:movie_app/presentation/home/widgets/popular_tv.dart';
import 'package:movie_app/presentation/home/widgets/trending_movies.dart';
import 'package:movie_app/presentation/search/pages/search.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        hideBack: true,
        action: IconButton(onPressed: () {
          AppNavigator.push(context,const SearchPage() );
        }, icon: Icon(Icons.search)),
        title: SvgPicture.asset(AppVectors.logo),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CategoryText(title: "Trending"),
            TrendingMovies(),
            SizedBox(
              height: 16,
            ),
            CategoryText(title: "Now Playing"),
            NowPlayingMovies(),
            SizedBox(
              height: 16,
            ),
            CategoryText(title: "Popular TV"),
            PopularTV(),
            SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}
