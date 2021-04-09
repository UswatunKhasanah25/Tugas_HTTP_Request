import 'dart:io';
import 'package:http/http.dart' as http;

class HttpService {
  final String apiKey = '424797f830ae59c43e98a66865cd53d3';
  final String baseUrl = 'https://api.themoviedb.org/3/movie/popular?api_key=424797f830ae59c43e98a66865cd53d3';

  Future<String> getPopularMovies() async {
    final String uri = baseUrl + apiKey;

    http.Response result = await http.get(Uri.parse(uri));
    if (result.statusCode == HttpStatus.ok) {
      print("Sukses");
      String response = result.body;
      return response;
    } else {
      print("Fail");
      return null;
    }
  }
}