import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:dio/dio.dart';

import 'package:movie_app/ui/movie_details.dart';
import '../pojos/Movie.dart';

class TopRatedList extends StatefulWidget {
  TopRatedList({Key key,}) : super(key: key);

  @override
  _TopRatedListState createState() => _TopRatedListState();
}

class _TopRatedListState extends State<TopRatedList> {
  final String _apiKey="f55fbda0cb73b855629e676e54ab6d8e";
  final String _url="https://api.themoviedb.org/3/movie/top_rated";
  final Dio dio = new Dio();
  List<dynamic> movies = [];


  Future<List<Movie>> getMovies() async{
    Response response= await dio.get(_url,
        queryParameters: {'api_key': _apiKey});
    movies=response.data['results'];
    return (movies as List)
        .map((movie) => Movie.fromJson(movie))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getMovies(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }
          if(snapshot.error != null){
            print("error:${snapshot.error}");
            return Center(child: Text((snapshot.error as Exception).toString(),));
          }
          return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context,int index){
                Movie movieDetails = snapshot.data[index];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder:(_) => MovieDetails.movieObject(movieDetails)));
                  },
                  child: Row(children: <Widget>[
                    Container(
                      width: 150,
                      height: 150,
                      child:  Padding(padding: EdgeInsets.all(4),
                        child: Hero(
                          tag: movieDetails.id,
                           child: Image.network(
                          movieDetails.posterPath,
                          fit: BoxFit.fill,
                           ),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: 200,
                          child: Text(
                            movieDetails.originalTitle,
                            style: TextStyle(
                                fontSize: 22,
                                decoration: TextDecoration.none,
                                color: Colors.grey),
                            textAlign: TextAlign.start,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          margin: EdgeInsets.only(left: 4),
                        ),

                        Padding(padding: EdgeInsets.only(top: 4),),
                        Row(
                          children: <Widget>[
                            Padding(padding: EdgeInsets.only(left: 4),),
                            Icon(Icons.timer,color: Colors.grey,size: 16,),
                            Padding(padding: EdgeInsets.only(left: 4),),
                            Text("2h 41m",
                              style: TextStyle(fontSize: 14,
                                  decoration: TextDecoration.none,
                                  color: Colors.grey) ,
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.only(top: 8),),
                        Row(
                          children: <Widget>[
                            Padding(padding: EdgeInsets.only(left: 4),),
                            Icon(Icons.date_range,color: Colors.grey,size: 16,),
                            Padding(padding: EdgeInsets.only(left: 4),),
                            Text(movieDetails.releaseDate,
                              style: TextStyle(fontSize: 14,
                                  decoration: TextDecoration.none,
                                  color: Colors.grey) ,
                            ),
                          ],
                        ),
                      ],
                    )

                  ],
                  ),
                );
              }
          );
        }
    );
  }

}
