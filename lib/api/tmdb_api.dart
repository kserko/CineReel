import 'dart:async';
import 'dart:convert';

import 'package:cine_reel/api/endpoints.dart';
import 'package:cine_reel/models/tmdb_genres.dart';
import 'package:cine_reel/models/tmdb_movie_details.dart';
import 'package:cine_reel/models/tmdb_movies_response.dart';
import 'package:cine_reel/models/tmdb_person.dart';
import 'package:cine_reel/models/tmdb_reviews_response.dart';
import 'package:http/http.dart' as http;

class TMDBApi {
  Future<TMDBMoviesResponse> discoverMovies({int page}) async {
    final response = await _makeRequest(Endpoints.discoverMoviesUrl(page));
    return TMDBMoviesResponse.fromJson(json.decode(response.body));
  }

  Future<TMDBMoviesResponse> nowPlayingMovies({int page}) async {
    final response = await _makeRequest(Endpoints.nowPlayingMoviesUrl(page));
    return TMDBMoviesResponse.fromJson(json.decode(response.body));
  }

  Future<TMDBMoviesResponse> topRated({int page}) async {
    final response = await _makeRequest(Endpoints.topRatedUrl(page));
    return TMDBMoviesResponse.fromJson(json.decode(response.body));
  }

  Future<TMDBMoviesResponse> popularMovies({int page}) async {
    final response = await _makeRequest(Endpoints.popularMoviesUrl(page));
    return TMDBMoviesResponse.fromJson(json.decode(response.body));
  }

	Future<TMDBMoviesResponse> upcomingMovies({int page, String region}) async {
		final response = await _makeRequest(Endpoints.upcomingMoviesUrl(page, region));
		return TMDBMoviesResponse.fromJson(json.decode(response.body));
	}
	
	Future<TMDBMovieDetails> movieDetails({int movieId}) async {
    final response = await _makeRequest(Endpoints.movieDetailsUrl(movieId));
    return TMDBMovieDetails.fromJson(json.decode(response.body));
  }

  Future<TMDBReviewsResponse> movieReviews({int movieId, int page}) async {
    final response = await _makeRequest(Endpoints.movieReviewsUrl(movieId, page));
    return TMDBReviewsResponse.fromJson(json.decode(response.body));
  }

  Future<TMDBMoviesResponse> searchMovie({String title}) async {
    final response = await _makeRequest(Endpoints.movieSearchUrl(title));
    return TMDBMoviesResponse.fromJson(json.decode(response.body));
  }

  Future<TMDBGenresResponse> getGenres() async {
    final response = await _makeRequest(Endpoints.genresUrl());
    return TMDBGenresResponse.fromJson(json.decode(response.body));
  }

  Future<TMDBMoviesResponse> moviesForGenre({TMDBGenre genre, int page}) async {
    final response = await _makeRequest(Endpoints.getMoviesForGenre(genre.id, page));
    return TMDBMoviesResponse.fromJson(json.decode(response.body));
  }

  Future<TMDBPerson> getPerson({int personId}) async {
    final response = await _makeRequest((Endpoints.getPerson(personId)));
    return TMDBPerson.fromJson(json.decode(response.body));
  }

  Future<http.Response> _makeRequest(String url) async {
    print("calling -> " + url);
    return await http.get(url);
  }
}
