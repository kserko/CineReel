import 'package:cine_reel/models/tmdb_movie_basic.dart';
import 'package:cine_reel/models/tmdb_movie_details.dart';
import 'package:cine_reel/ui/details_screen/movie_details_state.dart';

TMDBMovieBasic mockMovieOne = TMDBMovieBasic()
	..title = "Movie One"
	..releaseDate = "1.1.2042"
	..overview = "Movie One Overview";
TMDBMovieBasic mockMovieTwo = TMDBMovieBasic()..title = "Movie Two"..releaseDate = "1.2.2042";
TMDBMovieBasic mockMovieThree = TMDBMovieBasic()..title = "Movie Three"..releaseDate = "1.3.2042";

List<TMDBMovieBasic> mockMoviesList = [mockMovieOne, mockMovieTwo, mockMovieThree];

MovieDetailsState movieDetailsState = MovieDetailsState().initialState(movieDetails: TMDBMovieDetails(), movieBasic: mockMovieOne);
