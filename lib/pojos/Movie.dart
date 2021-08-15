class Movie{
  bool adult ;
  String posterPath ;
  String originalTitle ;
  int id;
  String overview ;
  String releaseDate ;
  num voteAverage ;
  num voteCount ;


  Movie({this.adult, this.posterPath, this.originalTitle, this.overview,
    this.releaseDate, this.voteAverage, this.voteCount});

  Movie.fromJson (Map<String, dynamic> map){
    adult = map["adult"];
    posterPath = map["poster_path"] == null ?"": "https://image.tmdb.org/t/p/w200" + map["poster_path"];
    originalTitle = map["original_title"];
    id=map["id"];
    overview = map["overview"];
    releaseDate = map["release_date"];
    voteAverage = map["vote_average"];
    voteCount = map["vote_count"];
  }
}