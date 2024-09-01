
import 'package:dio/dio.dart';
import 'package:movie_app_cubit/constants/strings.dart';

class MoviesApi{

  late Dio dio;
  MoviesApi(){
    BaseOptions options = BaseOptions(

      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: Duration( seconds: 20),
      receiveTimeout: Duration( seconds: 20),
    );
    dio=  Dio(options);

  }
  Future<List<dynamic>> getAllMovies()async{

    try{

  Response response = await dio.get('movies');
  return response.data;



  }catch(e){
    print(e.toString());
    return [];
  }

}}