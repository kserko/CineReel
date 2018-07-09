import 'package:json_annotation/json_annotation.dart';

part "MovieDetails.g.dart";

@JsonSerializable()
class MovieDetails extends Object with _$MovieDetailsSerializerMixin {
	
   bool adult;
   String backdropPath;
   Object belongsToCollection;
   int budget;
   List<Genre> genres = null;
   Object homepage;
   int id;
   String imdbId;
   String originalLanguage;
   String originalTitle;
   String overview;
   double popularity;
   String posterPath;
   List<ProductionCompany> productionCompanies = null;
   List<ProductionCountry> productionCountries = null;
   String releaseDate;
   int revenue;
   int runtime;
   List<SpokenLanguage> spokenLanguages = null;
   String status;
   String tagline;
   String title;
   bool video;
   double voteAverage;
   int voteCount;
  

	factory MovieDetails.fromJson(Map<String, dynamic> json) =>
			_$MovieDetailsFromJson(json);

	MovieDetails(this.adult, this.backdropPath, this.belongsToCollection,
			this.budget, this.genres, this.homepage, this.id, this.imdbId,
			this.originalLanguage, this.originalTitle, this.overview, this.popularity,
			this.posterPath, this.productionCompanies, this.productionCountries,
			this.releaseDate, this.revenue, this.runtime, this.spokenLanguages,
			this.status, this.tagline, this.title, this.video, this.voteAverage,
			this.voteCount);

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
	 factory Genre.fromJson(Map<String, dynamic> json) =>
			 _$GenreFromJson(json);

}
