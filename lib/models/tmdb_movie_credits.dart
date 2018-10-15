class TMDBMovieCredits {
	List<Cast> cast;
	List<Crew> crew;

	TMDBMovieCredits({this.cast, this.crew});

	TMDBMovieCredits.fromJson(Map<String, dynamic> json) {
		if (json['cast'] != null) {
			cast = new List<Cast>();
			json['cast'].forEach((v) {
				cast.add(new Cast.fromJson(v));
			});
		}
		if (json['crew'] != null) {
			crew = new List<Crew>();
			json['crew'].forEach((v) {
				crew.add(new Crew.fromJson(v));
			});
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.cast != null) {
			data['cast'] = this.cast.map((v) => v.toJson()).toList();
		}
		if (this.crew != null) {
			data['crew'] = this.crew.map((v) => v.toJson()).toList();
		}
		return data;
	}
}

class Cast {
	String releaseDate;
	bool adult;
	double voteAverage;
	int voteCount;
	bool video;
	String title;
	double popularity;
	List<int> genreIds;
	String originalLanguage;
	String character;
	String originalTitle;
	String posterPath;
	int id;
	String backdropPath;
	String overview;
	String creditId;

	Cast(
			{this.releaseDate,
				this.adult,
				this.voteAverage,
				this.voteCount,
				this.video,
				this.title,
				this.popularity,
				this.genreIds,
				this.originalLanguage,
				this.character,
				this.originalTitle,
				this.posterPath,
				this.id,
				this.backdropPath,
				this.overview,
				this.creditId});

	Cast.fromJson(Map<String, dynamic> json) {
		releaseDate = json['release_date'];
		adult = json['adult'];
		voteAverage =  json['vote_average'].toDouble();
		voteCount = json['vote_count'];
		video = json['video'];
		title = json['title'];
		popularity = json['popularity'];
		genreIds = json['genre_ids'].cast<int>();
		originalLanguage = json['original_language'];
		character = json['character'];
		originalTitle = json['original_title'];
		posterPath = json['poster_path'];
		id = json['id'];
		backdropPath = json['backdrop_path'];
		overview = json['overview'];
		creditId = json['credit_id'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['release_date'] = this.releaseDate;
		data['adult'] = this.adult;
		data['vote_average'] = this.voteAverage;
		data['vote_count'] = this.voteCount;
		data['video'] = this.video;
		data['title'] = this.title;
		data['popularity'] = this.popularity;
		data['genre_ids'] = this.genreIds;
		data['original_language'] = this.originalLanguage;
		data['character'] = this.character;
		data['original_title'] = this.originalTitle;
		data['poster_path'] = this.posterPath;
		data['id'] = this.id;
		data['backdrop_path'] = this.backdropPath;
		data['overview'] = this.overview;
		data['credit_id'] = this.creditId;
		return data;
	}
}

class Crew {
	int id;
	String department;
	String originalLanguage;
	String originalTitle;
	String job;
	String overview;
	List<int> genreIds;
	bool video;
	String creditId;
	String releaseDate;
	double popularity;
	double voteAverage;
	int voteCount;
	String title;
	bool adult;
	String backdropPath;
	String posterPath;

	Crew(
			{this.id,
				this.department,
				this.originalLanguage,
				this.originalTitle,
				this.job,
				this.overview,
				this.genreIds,
				this.video,
				this.creditId,
				this.releaseDate,
				this.popularity,
				this.voteAverage,
				this.voteCount,
				this.title,
				this.adult,
				this.backdropPath,
				this.posterPath});

	Crew.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		department = json['department'];
		originalLanguage = json['original_language'];
		originalTitle = json['original_title'];
		job = json['job'];
		overview = json['overview'];
		genreIds = json['genre_ids'].cast<int>();
		video = json['video'];
		creditId = json['credit_id'];
		releaseDate = json['release_date'];
		popularity = json['popularity'];
		voteAverage = json['vote_average'].toDouble();
		voteCount = json['vote_count'];
		title = json['title'];
		adult = json['adult'];
		backdropPath = json['backdrop_path'];
		posterPath = json['poster_path'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = this.id;
		data['department'] = this.department;
		data['original_language'] = this.originalLanguage;
		data['original_title'] = this.originalTitle;
		data['job'] = this.job;
		data['overview'] = this.overview;
		data['genre_ids'] = this.genreIds;
		data['video'] = this.video;
		data['credit_id'] = this.creditId;
		data['release_date'] = this.releaseDate;
		data['popularity'] = this.popularity;
		data['vote_average'] = this.voteAverage;
		data['vote_count'] = this.voteCount;
		data['title'] = this.title;
		data['adult'] = this.adult;
		data['backdrop_path'] = this.backdropPath;
		data['poster_path'] = this.posterPath;
		return data;
	}
}
