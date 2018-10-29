import 'package:cine_reel/api/omdb_api.dart';
import 'package:cine_reel/api/tmdb_api.dart';
import 'package:cine_reel/models/tmdb_movie_details.dart';
import 'package:mockito/mockito.dart';

class MockTMDBApi extends Mock implements TMDBApi {}
class MockOMDBApi extends Mock implements OMDBApi {}
class MockMovieDetails extends Mock implements TMDBMovieDetails {}
