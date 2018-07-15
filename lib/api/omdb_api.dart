import 'dart:async';
import 'dart:convert';

import 'package:flutter_bloc_movies/api/endpoints.dart';
import 'package:flutter_bloc_movies/models/omdb_movie.dart';
import 'package:http/http.dart' as http;

class OMDBApi {

  Future<OMDBMovie> getMovieByTitleAndYear({String title, String year}) async {
    final response = await _makeRequest(Endpoints.omdbMovieByTitleAndYear
			(title, year));
    return OMDBMovie.fromJson(json.decode(response.body));
  }

  Future<http.Response> _makeRequest(String url) async {
    print("calling -> " + url);
    return await http.get(url);
  }


}