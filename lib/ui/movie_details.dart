import 'package:flutter/material.dart';

import '../pojos/Movie.dart';

class MovieDetails extends StatelessWidget {

  Movie movieDetails ;
  MovieDetails.movieObject(this.movieDetails){
    this.movieDetails = movieDetails;
  }
  @override
  Widget build(BuildContext context) {

    return  SingleChildScrollView(
      child: Column(
        children: <Widget>[


      Hero(
      tag: movieDetails.id,
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.70,
              child: FittedBox(
                fit: BoxFit.fill,
                child: Image.network(
                    "https://image.tmdb.org/t/p/w200${
                        movieDetails.posterPath
                    }"),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 4),
                ),
                Container(
                  child: Text(
                    movieDetails.originalTitle,
                    style: TextStyle(
                        fontSize: 22,
                        decoration: TextDecoration.none,
                        color: Colors.grey),
                    textAlign: TextAlign.start,
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


                Padding(padding: EdgeInsets.only(top: 8,left: 4),child:Text(movieDetails.overview,
                  style: TextStyle(fontSize: 16,
                    decoration: TextDecoration.none,
                    color: Colors.white70,) ,
                ), ),

              ],
            ),
          )
        ],
      ),
    );
    //throw UnimplementedError();
  }
}
