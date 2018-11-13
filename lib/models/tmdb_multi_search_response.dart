import 'package:json_annotation/json_annotation.dart';

part 'tmdb_multi_search_response.g.dart';

@JsonSerializable()
class TMDBMultiSearchResponse {
  @JsonKey(name: "page")
  int page;
  @JsonKey(name: "total_results")
  int totalResults;
  @JsonKey(name: "total_pages")
  int totalPages;
  @JsonKey(name: "results")
  List<TMDBMultiSearchResult> results;

  TMDBMultiSearchResponse({this.page, this.totalResults, this.totalPages, this.results});

  factory TMDBMultiSearchResponse.fromJson(Map<String, dynamic> json) =>
      _$TMDBMultiSearchResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TMDBMultiSearchResponseToJson(this);
}

@JsonSerializable()
class TMDBMultiSearchResult {
  @JsonKey(name: "vote_average")
  double voteAverage;
  @JsonKey(name: "vote_count")
  int voteCount;
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "video")
  bool video;
  @JsonKey(name: "media_type")
  String mediaType;
  @JsonKey(name: "title")
  String title;
  @JsonKey(name: "popularity")
  double popularity;
  @JsonKey(name: "poster_path")
  String posterPath;
  @JsonKey(name: "orignal_language")
  String originalLanguage;
  @JsonKey(name: "original_title")
  String originalTitle;
  @JsonKey(name: "genre_ids")
  List<int> genreIds;
  @JsonKey(name: "backdrop_path")
  String backdropPath;
  @JsonKey(name: "adult")
  bool adult;
  @JsonKey(name: "overview")
  String overview;
  @JsonKey(name: "release_date")
  String releaseDate;
  @JsonKey(name: "profile_path")
  String profilePath;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "known_for")
  List<KnownFor> knownFor;

  TMDBMultiSearchResult(
      {this.voteAverage,
      this.voteCount,
      this.id,
      this.video,
      this.mediaType,
      this.title,
      this.popularity,
      this.posterPath,
      this.originalLanguage,
      this.originalTitle,
      this.genreIds,
      this.backdropPath,
      this.adult,
      this.overview,
      this.releaseDate});

  factory TMDBMultiSearchResult.fromJson(Map<String, dynamic> json) =>
      _$TMDBMultiSearchResultFromJson(json);

  Map<String, dynamic> toJson() => _$TMDBMultiSearchResultToJson(this);
}

@JsonSerializable()
class KnownFor {
  int id;
  bool video;
  String title;
  double popularity;
  bool adult;
  String overview;
  @JsonKey(name: "poster_path")
  String posterPath;
  @JsonKey(name: "release_date")
  String releaseDate;
  @JsonKey(name: 'vote_count')
  int voteCount;
  @JsonKey(name: "vote_average")
  double voteAverage;
  @JsonKey(name: "original_language")
  String originalLanguage;
  @JsonKey(name: "original_title")
  String originalTitle;
  @JsonKey(name: "genre_ids")
  List<int> genreIds;
  @JsonKey(name: "backdrop_path")
  String backdropPath;
  @JsonKey(name: "original_name")
  String originalName;
  @JsonKey(name: "media_type")
  String mediaType;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "first_air_date")
  String firstAirDate;
  @JsonKey(name: "original_country")
  List<String> originCountry;

	KnownFor(this.id, this.video, this.title, this.popularity, this.adult, this.overview,
			this.posterPath, this.releaseDate, this.voteCount, this.voteAverage, this.originalLanguage,
			this.originalTitle, this.genreIds, this.backdropPath, this.originalName, this.mediaType,
			this.name, this.firstAirDate, this.originCountry);

	factory KnownFor.fromJson(Map<String, dynamic> json) => _$KnownForFromJson(json);

  Map<String, dynamic> toJson() => _$KnownForToJson(this);
}
