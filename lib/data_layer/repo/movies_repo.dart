import 'package:flutter/cupertino.dart';

import '../apis/all_movies_api.dart';
import '../models/movies.dart';

class MoviesRepo{
final MoviesApi moviesApi;

  MoviesRepo(this.moviesApi);


Future<List<Movies>> getAllMovies()async{
  final movies= await moviesApi.getAllMovies();
  return movies.map((movies)=>Movies.fromJson(movies)).toList();

}

}