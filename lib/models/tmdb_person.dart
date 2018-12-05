import 'package:cine_reel/models/tmdb_movie_credits.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tmdb_person.g.dart';

@JsonSerializable()
class TMDBPerson {
  String birthday;
  @JsonKey(name: "known_for_department") String knownForDepartment;
  @JsonKey(name: "death_day") String deathDay;
  int id;
  String name;
	@JsonKey(name: "also_known_as") List<String> alsoKnownAs;
  int gender;
  String biography;
  double popularity;
	@JsonKey(name: "place_of_birth") String placeOfBirth;
	@JsonKey(name: "profile_path") String profilePath;
  bool adult;
	@JsonKey(name: "imdb_id") String imdbId;
  String homepage;
	@JsonKey(name: "movie_credits") TMDBMovieCredits movieCredits;

  TMDBPerson(
      {this.birthday,
      this.knownForDepartment,
      this.deathDay,
      this.id,
      this.name,
      this.alsoKnownAs,
      this.gender,
      this.biography,
      this.popularity,
      this.placeOfBirth,
      this.profilePath,
      this.adult,
      this.imdbId,
      this.homepage,
      this.movieCredits});

	factory TMDBPerson.fromJson(Map<String, dynamic> json) => _$TMDBPersonFromJson(json);
	Map<String, dynamic> toJson() => _$TMDBPersonToJson(this);


  bool hasBiography() {
    return biography != null && biography.isNotEmpty;
  }

  bool hasBirthdayDetails() {
    return birthday != null && birthday.isNotEmpty;
  }

  String getFormattedBirthday() {
    var parsedBirthDate = DateFormat("yyyy-MM-dd").parse(birthday);

    var birthYear = DateTime.now().year - parsedBirthDate.year;

    if (isDead()) {
      var parsedDeathDate = DateFormat("yyyy-MM-dd").parse(deathDay);
      return "${DateFormat('yyyy').format(parsedBirthDate)} - ${parsedDeathDate.year} ($birthYear)";
    }
    return "${DateFormat('MMM dd yyyy').format(parsedBirthDate)} ($birthYear)";
  }

  String getPlaceOfBirth() {
    if (placeOfBirth != null && placeOfBirth.isNotEmpty) {
      return "born in $placeOfBirth";
    }
    return "";
  }

  bool isDead() {
    return deathDay != null && deathDay.isNotEmpty;
  }

  bool hasMovieCredits() {
    return movieCredits != null && movieCredits.movieCreditsAsCast.isNotEmpty;
  }

  bool isEmpty() {
    return id == null || name == null;
  }
}
