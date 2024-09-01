import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_cubit/business_logic_layer/movies_cubit.dart';
import 'package:movie_app_cubit/data_layer/repo/movies_repo.dart';
import 'package:movie_app_cubit/presentation_layer/screens/movie_details_screen.dart';
import 'package:movie_app_cubit/presentation_layer/screens/movies_screen.dart';

import 'data_layer/apis/all_movies_api.dart';

 const moviesScreen='/';
const movieDetails='/movieDetails';



class AppRouter{
  late  MoviesRepo moviesRepo;
  late  MoviesCubit moviesCubit;

AppRouter(){
  moviesRepo=MoviesRepo(MoviesApi());
  moviesCubit=  MoviesCubit(moviesRepo);

}
  Route? generateRoute(RouteSettings settings){
switch(settings.name){
  case moviesScreen:
    return MaterialPageRoute(builder: (_)=> BlocProvider<MoviesCubit>(
      create: (context) => MoviesCubit(moviesRepo),
      child: MoviesScreen(),
    )   );

  case movieDetails:
    return MaterialPageRoute(builder: (_)=> MovieDetailsScreen()   );


}
}


}