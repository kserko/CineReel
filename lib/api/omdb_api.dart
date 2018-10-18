import 'dart:async';
import 'dart:convert';

import 'package:cine_reel/api/endpoints.dart';
import 'package:cine_reel/models/omdb_movie.dart';
import 'package:http/http.dart' as http;

class OMDBApi {
  Future<OMDBMovie> getMovieByTitleAndYear({String title, String year}) async {
    final response = await _makeRequest(Endpoints.omdbMovieByTitleAndYearUrl(title, year));
    return OMDBMovie.fromJson(json.decode(response.body));
  }

  Future<http.Response> _makeRequest(String url) async {
    print("calling -> " + url);
    return await http.get(url);
  }
}
