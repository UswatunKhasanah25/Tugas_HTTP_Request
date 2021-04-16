import 'package:flutter/material.dart';
import 'package:http_request/service/http_service.dart';
import 'package:http_request/pages/movie_detail.dart';

class MovieList extends StatefulWidget {
  @override 
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  int moviesCount;
  List movies;
  HttpService service;
  String imgPath = 'https://image.tmdb.org/t/p/w500/';

  Future initialize() async {
    movies = [];
    movies = await service.getPopularMovies();
    setState(() {
      moviesCount = movies.length;
      movies = movies;
    });
  }

  @override 
  void initState() {
    service = HttpService();
    initialize();
    super.initState();
  }

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("Popular Movies"),
      ),
      body: ListView.builder(
        itemCount: (this.moviesCount == null) ? 0 : this.moviesCount,
        itemBuilder: (context, int position) {
          return Card(
            color: Colors.black,
            elevation: 3.0,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    height: 150,
                    child: Image.network(imgPath + movies[position].posterPath),
                  )
                ),
                Expanded(
                  child: ListTile(
                    title: Text(movies[position].title,
                      style: TextStyle(color: Colors.white, fontSize: 25)),
                    subtitle: Row(
                      children: [
                        Icon(Icons.star_rate_rounded, size: 30, color: Colors.yellow),
                        Text(movies[position].voteAverage.toString(), 
                          style: TextStyle(color: Colors.yellow, fontSize: 25),
                          ),
                      ],
                    ),
                    onTap: () {
                      MaterialPageRoute route = MaterialPageRoute (
                       builder: (_) => MovieDetail(movies[position]));
                      Navigator.push(context, route);
                    },    
                 ),
                ),
              ]
            ),
          );
        },
      ),
    );
  }
}
