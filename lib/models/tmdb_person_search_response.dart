import 'package:json_annotation/json_annotation.dart';

part 'tmdb_person_search_response.g.dart';

@JsonSerializable()
class TMDBPersonSearchResponse {
	@JsonKey(name: "page") int page;
	@JsonKey(name: "total_results") int totalResults;
	@JsonKey(name: "total_pages") int totalPages;
	@JsonKey(name: "results") List<TMDBPersonBasic> results;
	@JsonKey(name: "errors")
	List<String> errors;

	TMDBPersonSearchResponse({this.page, this.totalResults, this.totalPages, this.results});

	factory TMDBPersonSearchResponse.fromJson(Map<String, dynamic> json) =>
			_$TMDBPersonSearchResponseFromJson(json);

	Map<String, dynamic> toJson() => _$TMDBPersonSearchResponseToJson(this);

	bool get isEmpty => !hasResults();

	hasResults() {
		return results != null && results.length > 0;
	}

	hasErrors() {
		return errors != null && errors.length > 0;
	}
}

@JsonSerializable()
class TMDBPersonBasic {
	String name;
	double popularity;
	int id;
	@JsonKey(name: "profile_path") String profilePath;

	TMDBPersonBasic({this.popularity, this.id, this.profilePath, this.name});

	factory TMDBPersonBasic.fromJson(Map<String, dynamic> json) =>
			_$TMDBPersonBasicFromJson(json);

	Map<String, dynamic> toJson() => _$TMDBPersonBasicToJson(this);
}
