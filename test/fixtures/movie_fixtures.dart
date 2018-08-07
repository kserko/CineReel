import 'package:cine_reel/models/tmdb_movie_basic.dart';
import 'package:mockito/mockito.dart';

class MockMovie extends Mock implements TMDBMovieBasic {}

List<TMDBMovieBasic> createMockBasicMovies({numberOfMovies = 3}) {
	List<TMDBMovieBasic> listOfMovies = [];
	for (var i = 0; i < numberOfMovies; i++ ) {
		var mockMovie = MockMovie();
		when(mockMovie.title).thenReturn("Mock Movie Title $i");
		when(mockMovie.releaseDate).thenReturn("$i.1.2042");
		listOfMovies.add(mockMovie);
	}
	return listOfMovies;
}
