import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app_cubit/data_layer/repo/movies_repo.dart';

import '../data_layer/models/movies.dart';

part 'movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  final MoviesRepo moviesRepo;
  List<Movies> movies=[];
  MoviesCubit(this.moviesRepo) : super(MoviesInitial());

  List<Movies> getAllMovies(){
    moviesRepo.getAllMovies().then((movies){
      emit(MoviesLoaded(movies));
      this.movies=movies;

    });
    return movies;
  }
}