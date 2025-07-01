import 'package:flutter_bloc/flutter_bloc.dart';

enum SearchType { movie, tv }

class SelectableOptionCubit extends Cubit<SearchType> {
  SelectableOptionCubit() : super(SearchType.movie);

  void seletMovie() => emit(SearchType.movie);

  void seletTV() => emit(SearchType.tv);
}
