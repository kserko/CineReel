import 'package:json_annotation/json_annotation.dart';

part "MovieDetails.g.dart";

@JsonSerializable()
class TMDBMovieDetails extends Object with _$MovieDetailsSerializerMixin {
	@JsonKey(name: "status_message") String status_message;
  @JsonKey(name:"backdrop_path") String backdropPath;
	@JsonKey(name:"belongs_to_collection") Object belongsToCollection;
	@JsonKey(name:"imdb_id") String imdbId;
	@JsonKey(name:"original_language") String originalLanguage;
	@JsonKey(name:"original_title") String originalTitle;
	@JsonKey(name:"poster_path") String posterPath;
	@JsonKey(name:"production_companies") List<ProductionCompany>productionCompanies = null;
	@JsonKey(name:"production_countries") List<ProductionCountry>productionCountries = null;
	@JsonKey(name:"release_date") String releaseDate;
	@JsonKey(name:"spoken_languages") List<SpokenLanguage> spokenLanguages = null;
	@JsonKey(name:"tag_line") String tagline;
	@JsonKey(name:"vote_average") double voteAverage;
	@JsonKey(name:"vote_count") int voteCount;String overview;
	bool adult;
	int budget;
	List<Genre> genres = null;
	Object homepage;
	int id;
  double popularity;
  int revenue;
  int runtime;
  String status;
  String title;
  bool video;

  String getFormattedRunningTime() {
  	if (runtime != null) {
			String hours = (runtime / 60).floor().toString();
			String hourLabel = hours == 1 ? "hr" : "hrs";
			String minutes = (runtime % 60).toString();

			return "$hours $hourLabel $minutes mins";
		}
		return "";
	}

	String getFormattedReleaseDate() {
  	String year = releaseDate?.split('-')[0];
  	return year != null ? "$year" : "";
	}

  factory TMDBMovieDetails.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailsFromJson(json);

  TMDBMovieDetails(
      this.adult,
      this.backdropPath,
      this.belongsToCollection,
      this.budget,
      this.genres,
      this.homepage,
      this.id,
      this.imdbId,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.productionCompanies,
      this.productionCountries,
      this.releaseDate,
      this.revenue,
      this.runtime,
      this.spokenLanguages,
      this.status,
      this.tagline,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount,
			this.status_message);

	hasErrors() {
		return status_message != null;
	}

}

@JsonSerializable()
class ProductionCompany extends Object with _$ProductionCompanySerializerMixin {
  int id;
  Object logoPath;
  String name;
  String originCountry;

  ProductionCompany(this.id, this.logoPath, this.name, this.originCountry);

  factory ProductionCompany.fromJson(Map<String, dynamic> json) =>
      _$ProductionCompanyFromJson(json);
}

@JsonSerializable()
class ProductionCountry extends Object with _$ProductionCountrySerializerMixin {
  String iso31661;
  String name;

  ProductionCountry(this.iso31661, this.name);

  factory ProductionCountry.fromJson(Map<String, dynamic> json) =>
      _$ProductionCountryFromJson(json);
}

@JsonSerializable()
class SpokenLanguage extends Object with _$SpokenLanguageSerializerMixin {
  String iso6391;
  String name;

  SpokenLanguage(this.iso6391, this.name);

  factory SpokenLanguage.fromJson(Map<String, dynamic> json) =>
      _$SpokenLanguageFromJson(json);
}

@JsonSerializable()
class Genre extends Object with _$GenreSerializerMixin {
  int id;
  String name;

  Genre(this.id, this.name);

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);
}
