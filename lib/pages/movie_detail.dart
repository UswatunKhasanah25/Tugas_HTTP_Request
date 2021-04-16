import 'package:flutter/material.dart';
import 'package:http_request/models/movie.dart';

class MovieDetail extends StatelessWidget {
  final Movie movie;
  final String imgPath = 'https://image.tmdb.org/t/p/w500/';

  MovieDetail(this.movie);

  @override 
  Widget build(BuildContext context) {
    String path;
    if(movie.posterPath != null){
      path = imgPath + movie.posterPath;
    } else {
      path = 'https://images.freeimages.com/images/large-previews/5eb/movie-clapboard-1184339.jpg';
    }
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Movie Detail"),
      ),
      body: SingleChildScrollView(
       child: Center(
         child: Column(
           children: [
             Container(
                padding: EdgeInsets.all(16),
                height: height / 1.5,
                color: Colors.black,
                child: Image.network(path)
              ),
              
              Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.center,
                color: Colors.black,
                child: Column(
                  children: [
                    Text(movie.title, style: TextStyle(color: Colors.white, fontSize: 35),),
                    Text(movie.overview, style: TextStyle(color: Colors.white, fontSize: 20),),
                  ]
                ),
                )
           ]
         )
           ), 
      )
    );
  }
}