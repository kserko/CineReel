import 'dart:async';
import 'dart:convert';

import 'package:flutter_bloc_movies/api/endpoints.dart';
import 'package:flutter_bloc_movies/models/MovieDetails.dart';
import 'package:flutter_bloc_movies/models/MoviesResponse.dart';
import 'package:http/http.dart' as http;

class TMDBApi {

  Future<MoviesResponse> discoverMovies({int page}) async {
    final response = await _makeRequest(Endpoints.discoverMoviesUrl(page));
    return MoviesResponse.fromJson(json.decode(response.body));
  }

  Future<MoviesResponse> nowPlayingMovies({int page}) async {
    final response = await _makeRequest(Endpoints.nowPlayingMoviesUrl(page));
		return MoviesResponse.fromJson(json.decode(response.body));
  }

  Future<MoviesResponse> topRated({int page}) async {
    final response = await _makeRequest(Endpoints.topRatedUrl(page));
    return MoviesResponse.fromJson(json.decode(response.body));
  }

  Future<MoviesResponse> popularMovies({int page}) async {
    final response = await _makeRequest(Endpoints.popularMoviesUrl(page));
    return MoviesResponse.fromJson(json.decode(response.body));
  }

  Future<MovieDetails> movieDetails({int movieId}) async {
  	final response = await _makeRequest(Endpoints.movieDetailsUrl(movieId));
  	return MovieDetails.fromJson(json.decode(response.body));
	}

  Future<http.Response> _makeRequest(String url) async {
    print("calling -> " + url);
    return await http.get(url);
  }


}