import 'package:cine_reel/models/tmdb_movie_basic.dart';
import 'package:cine_reel/models/tmdb_movie_details.dart';
import 'package:cine_reel/ui/details_screen/movie_details_state.dart';

TMDBMovieBasic movieOne = TMDBMovieBasic()
  ..title = "Movie One"
  ..releaseDate = "1.1.2042"
  ..overview = "Movie One Overview";
TMDBMovieBasic movieTwo = TMDBMovieBasic()
  ..title = "Movie Two"
  ..releaseDate = "1.2.2042";
TMDBMovieBasic movieThree = TMDBMovieBasic()
  ..title = "Movie Three"
  ..releaseDate = "1.3.2042";

List<TMDBMovieBasic> basicMoviesList = [movieOne, movieTwo, movieThree];

TMDBMovieDetails movieDetails = TMDBMovieDetails()
  ..id = 1
  ..adult = false
  ..backdropPath = ""
  ..title = movieOne.title
  ..releaseDate = movieOne.releaseDate
	..popularity = 10.0
	..posterPath = ""
  ..movieBasic = movieOne;

MovieDetailsState movieDetailsState =
    MovieDetailsState(movieDetails: TMDBMovieDetails(), movieBasic: movieOne);
