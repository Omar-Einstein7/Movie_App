import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/domain/movie/usecases/search_movies.dart';
import 'package:movie_app/domain/tv/usecases/search_tv.dart';
import 'package:movie_app/presentation/search/bloc/search_state.dart';
import 'package:movie_app/presentation/search/bloc/selectable_option_cubit.dart';
import 'package:movie_app/service_locator.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchIntial());

  TextEditingController textEditingController = TextEditingController();

  void search(String query, SearchType searchType) {
    if (query.isNotEmpty) {
      emit(SearchLoading());
    }

    switch (searchType) {
      case SearchType.movie:
        searchMovie(query);
        break;

      case SearchType.tv:
        searchTV(query);
        break;
    }
  }

  void searchMovie(String query) async {
    var returnData = await sl<SearchMoviesUsecase>().call(params: query);
    returnData.fold((errorMessage) {
      emit(SearchFailure(errorMessage: errorMessage));
    }, (data) {
      emit(MoviesLoaded(movies: data));
    });
  }

  void searchTV(String query) async {
    var returnData = await sl<SearchTvUsecase>().call(params: query);
    returnData.fold((errorMessage) {
      emit(SearchFailure(errorMessage: errorMessage));
    }, (data) {
      emit(TVsLoaded(tvs: data));
    });
  }
}
