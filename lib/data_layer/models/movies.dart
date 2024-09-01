class Movies{
  int? id;
  String? title;
  int? year;
  dynamic? poster;
   List<dynamic>? appearance;
   int? rating;
   List<String>? actors;
   String? country;
   String? langauage;

Movies.fromJson(Map<String,dynamic>json){
  id=json['id'];
  title=json['title'];
  year=json['year'];
  poster=json['id'];
  appearance=json['genre'];
  rating=json['rating'];
  actors=json['actors'];
  country=json['country'];
  langauage=json['language'];





}


}


