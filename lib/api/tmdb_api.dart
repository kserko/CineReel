import 'dart:async';
import 'dart:convert';

import 'package:flutter_bloc_movies/api/endpoints.dart';
import 'package:flutter_bloc_movies/models/tmdb_movie_details.dart';
import 'package:flutter_bloc_movies/models/tmdb_movies_collection_response.dart';
import 'package:http/http.dart' as http;

class TMDBApi {

  Future<TMDBMoviesCollectionResponse> discoverMovies({int page}) async {
    final response = await _makeRequest(Endpoints.discoverMoviesUrl(page));
    return TMDBMoviesCollectionResponse.fromJson(json.decode(response.body));
  }

  Future<TMDBMoviesCollectionResponse> nowPlayingMovies({int page}) async {
    final response = await _makeRequest(Endpoints.nowPlayingMoviesUrl(page));
		return TMDBMoviesCollectionResponse.fromJson(json.decode(response.body));
  }

  Future<TMDBMoviesCollectionResponse> topRated({int page}) async {
    final response = await _makeRequest(Endpoints.topRatedUrl(page));
    return TMDBMoviesCollectionResponse.fromJson(json.decode(response.body));
  }

  Future<TMDBMoviesCollectionResponse> popularMovies({int page}) async {
    final response = await _makeRequest(Endpoints.popularMoviesUrl(page));
    return TMDBMoviesCollectionResponse.fromJson(json.decode(response.body));
  }

  Future<TMDBMovieDetails> movieDetails({int movieId}) async {
  	final response = await _makeRequest(Endpoints.movieDetailsUrl(movieId));
  	return TMDBMovieDetails.fromJson(json.decode(response.body));
	}

  Future<http.Response> _makeRequest(String url) async {
    print("calling -> " + url);
    return await http.get(url);
  }


}