const String APP_NAME = "CineReel";
const String OMDB_API_BASE_URL = "https://www.omdbapi.com";
const String TMDB_API_BASE_URL = "https://api.themoviedb.org/3";
const String IMDB_MOVIE_PAGE_BASE_URL = "https://www.imdb.com/title";
const String TMDB_MOVIE_PAGE_BASE_URL = "https://www.themoviedb.org/movie";

const String TMDB_BASE_IMAGE_URL = "http://image.tmdb.org/t/p/";
enum IMAGE_TYPE { POSTER, BACKDROP }

var PROFILE_SIZES = {
	"small": "w45",
	"medium": "w185",
	"large": "h632",
	"original": "original"
};

var BACKDROP_SIZES = {
  "small": "w300",
  "medium": "w780",
  "large": "w1280",
  "original": "original"
};

var POSTER_SIZES = {
	"smallest": "w92",
	"small": "w154",
	"medium": "w185",
	"large": "w342",
	"larger": "w500",
	"largest": "w780",
	"original": "original"
};