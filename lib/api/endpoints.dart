import 'package:cine_reel/Constants.dart';

class Endpoints {
  static String discoverMoviesUrl(int page) {
    return '$BASE_TMDB_URL'
        '/discover/movie?api_key='
        '$TMDB_API_KEY'
        '&language=en-US&sort_by=popularity'
        '.desc&include_adult=false&include_video=false&page'
        '=$page';
  }

  static String nowPlayingMoviesUrl(int page) {
    return '$BASE_TMDB_URL'
        '/movie/now_playing?api_key='
        '$TMDB_API_KEY'
        '&include_adult=false&page=$page';
  }

  static String topRatedUrl(int page) {
    return '$BASE_TMDB_URL'
        '/movie/top_rated?api_key='
        '$TMDB_API_KEY'
        '&include_adult=false&page=$page';
  }

  static String popularMoviesUrl(int page) {
    return '$BASE_TMDB_URL'
        '/movie/popular?api_key='
        '$TMDB_API_KEY'
        '&include_adult=false&page=$page';
  }

  static String movieDetailsUrl(int movieId) {
    return '$BASE_TMDB_URL/movie/$movieId?api_key=$TMDB_API_KEY&append_to_response=credits';
  }

  static String movieReviewsUrl(int movieId, int page) {
		return '$BASE_TMDB_URL/movie/$movieId/reviews?api_key=$TMDB_API_KEY'
				'&language=en-US&page=$page';
	}

  static String omdbMovieByTitleAndYearUrl(String title, String year) {
    return "$BASE_OMDB_URL/?t=$title&y=$year&apikey=$OMDB_API_KEY";
  }

  static String movieSearchUrl(String title) {
  	return "$BASE_TMDB_URL/search/movie?query=$title&api_key=$TMDB_API_KEY";
	}
}
