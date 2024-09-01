part of 'movies_cubit.dart';

@immutable
abstract class MoviesState {}

class MoviesInitial extends MoviesState {

}
class MoviesLoaded extends MoviesState{
late final List<Movies> movies;
MoviesLoaded(this.movies);
}