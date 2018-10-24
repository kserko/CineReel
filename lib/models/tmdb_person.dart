import 'package:cine_reel/models/tmdb_movie_credits.dart';
import 'package:intl/intl.dart';

class TMDBPerson {
  String birthday;
  String knownForDepartment;
  String deathDay;
  int id;
  String name;
  List<String> alsoKnownAs;
  int gender;
  String biography;
  double popularity;
  String placeOfBirth;
  String profilePath;
  bool adult;
  String imdbId;
  String homepage;
  TMDBMovieCredits movieCredits;

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

  TMDBPerson.fromJson(Map<String, dynamic> json) {
    birthday = json['birthday'];
    knownForDepartment = json['known_for_department'];
    deathDay = json['deathday'];
    id = json['id'];
    name = json['name'];
    alsoKnownAs = json['also_known_as']?.cast<String>();
    gender = json['gender'];
    biography = json['biography'];
    popularity = json['popularity'];
    placeOfBirth = json['place_of_birth'];
    profilePath = json['profile_path'];
    adult = json['adult'];
    imdbId = json['imdb_id'];
    homepage = json['homepage'];
    movieCredits =
        json['movie_credits'] != null ? TMDBMovieCredits.fromJson(json['movie_credits']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['birthday'] = this.birthday;
    data['known_for_department'] = this.knownForDepartment;
    data['deathday'] = this.deathDay;
    data['id'] = this.id;
    data['name'] = this.name;
    data['also_known_as'] = this.alsoKnownAs;
    data['gender'] = this.gender;
    data['biography'] = this.biography;
    data['popularity'] = this.popularity;
    data['place_of_birth'] = this.placeOfBirth;
    data['profile_path'] = this.profilePath;
    data['adult'] = this.adult;
    data['imdb_id'] = this.imdbId;
    data['homepage'] = this.homepage;
    if (this.movieCredits != null) {
      data['movie_credits'] = this.movieCredits.toJson();
    }
    return data;
  }

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
