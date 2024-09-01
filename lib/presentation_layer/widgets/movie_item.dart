import 'package:flutter/material.dart';
import 'package:movie_app_cubit/constants/my_colors.dart';

import '../../data_layer/models/movies.dart';
class MovieItem extends StatelessWidget {
  final Movies movies;
   MovieItem({Key? key,required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: EdgeInsetsDirectional.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: GridTile(
        child: Container(
          color: Colors.grey,
          child: movies.poster!.isNotEmpty ? FadeInImage.assetNetwork(placeholder: 'assets/images/loading.gif',
            image: movies.poster,fit: BoxFit.cover,):Image.asset('name')
        ),
        footer: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 15,vertical: 13),
          color: Colors.black54,
          alignment: Alignment.bottomCenter,
          child: Text('${movies.title}',overflow: TextOverflow.ellipsis,maxLines: 2,textAlign: TextAlign.center,),),
        ),
      );

  }
}
