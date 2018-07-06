import 'package:flutter_bloc_movies/Constants.dart';

class Endpoints {

  static String discoverMoviesUrl(int page) {
  return '$BASE_API_URL'
      '/discover/movie?api_key='
      '$TMDB_API_TOKEN'
      '&language=en-US&sort_by=popularity'
      '.desc&include_adult=false&include_video=false&page'
      '=$page';
  }

  static String nowPlayingMoviesUrl(int page) {
    return '$BASE_API_URL'
        '/movie/now_playing?api_key='
        '$TMDB_API_TOKEN'
        '&include_adult=false&page=$page';
  }

  static String topRatedUrl(int page) {
    return '$BASE_API_URL'
        '/movie/top_rated?api_key='
        '$TMDB_API_TOKEN'
        '&include_adult=false&page=$page';
  }

  static String popularMoviesUrl(int page) {
    return '$BASE_API_URL'
        '/movie/popular?api_key='
        '$TMDB_API_TOKEN'
        '&include_adult=false&page=$page';
  }
}