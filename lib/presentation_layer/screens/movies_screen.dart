import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_cubit/business_logic_layer/movies_cubit.dart';
import 'package:movie_app_cubit/constants/my_colors.dart';
import 'package:movie_app_cubit/presentation_layer/screens/movie_details_screen.dart';
import 'package:movie_app_cubit/presentation_layer/widgets/movie_item.dart';

import '../../data_layer/models/movies.dart';
class MoviesScreen extends StatefulWidget {
   MoviesScreen({Key? key}) : super(key: key);

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}
class _MoviesScreenState extends State<MoviesScreen> {
late List<Movies> allMovies;


  @override
  void initState(){
    super.initState();
    BlocProvider.of<MoviesCubit>(context).getAllMovies();

  }
  Widget buildBlocWidget(){
    return 
        BlocBuilder<MoviesCubit, MoviesState>(
          builder: (context, state) {
            if (state is MoviesLoaded) {
              allMovies = state.movies;
              return
                buildLoadedListWidget();
            } else {
              return
                  CircularProgressIndicator();
            }
          }
        );
  }

  Widget buildLoadedListWidget(){
    return SingleChildScrollView(
      child: Container(
       color:Colors.yellow,
           child: Column(
             children: [
               buildMoviesList()

             ],

      ),
      ),
    );
  }
Widget buildMoviesList(){
    return
        GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2/3,
          mainAxisSpacing: 1
        ),
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemCount: allMovies.length,
          itemBuilder: (BuildContext context, int index) {
          return
              InkWell(
                onTap: (){
                  Navigator.pushNamed(context, MovieDetailsScreen(data:allMovies[index]).toString());
                },
                  child: MovieItem(movies: allMovies[index],));
        },);
}
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text('Movies'),
      ),
      body: buildBlocWidget()
    );
  }
}
