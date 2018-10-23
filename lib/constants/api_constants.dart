const String APP_NAME = "CineReel";
const String OMDB_API_BASE_URL = "https://www.omdbapi.com";
const String TMDB_API_BASE_URL = "https://api.themoviedb.org/3";
const String IMDB_MOVIE_PAGE_BASE_URL = "https://www.imdb.com/title";
const String IMDB_PERSON_PAGE_BASE_URL = "https://www.imdb.com/name";
const String TMDB_MOVIE_PAGE_BASE_URL = "https://www.themoviedb.org/movie";
const String ROTTEN_TOMATOES_MOVIE_PAGE_BASE_URL = "https://www.rottentomatoes.com/m";
const String METACRITIC_MOVIE_PAGE_BASE_URL = "http://www.metacritic.com/movie";
const String TMDB_BASE_IMAGE_URL = "http://image.tmdb.org/t/p/";
enum IMAGE_TYPE { POSTER, BACKDROP, PROFILE }

const SIZE_SMALL = "small";
const SIZE_MEDIUM = "medium";
const SIZE_LARGE = "large";

const POSTER_SIZE = SIZE_LARGE;
const PROFILE_SIZE = SIZE_LARGE;

var PROFILE_SIZES = {
  "$SIZE_SMALL": "w45",
  "$SIZE_MEDIUM": "w185",
  "$SIZE_LARGE": "h632",
  "original": "original"
};

var BACKDROP_SIZES = {
  "$SIZE_SMALL": "w300",
  "$SIZE_MEDIUM": "w780",
  "$SIZE_LARGE": "w1280",
  "original": "original"
};

var POSTER_SIZES = {
  "smallest": "w92",
  "$SIZE_SMALL": "w154",
  "$SIZE_MEDIUM": "w185",
  "$SIZE_LARGE": "w342",
  "larger": "w500",
  "largest": "w780",
  "original": "original"
};
