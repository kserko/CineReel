import 'package:cine_reel/constants/api_constants.dart';
import 'package:cine_reel/models/tmdb_movie_basic.dart';
import 'package:cine_reel/models/tmdb_movie_details.dart';
import 'package:cine_reel/models/tmdb_person_search_response.dart';
import 'package:cine_reel/navigation/router.dart';
import 'package:cine_reel/ui/common_widgets/image_loader.dart';
import 'package:cine_reel/ui/list_screen/movie_row/poster_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchResultWidget extends StatelessWidget {
  final List<TMDBMovieBasic> movies;
  final List<TMDBPersonBasic> people;

  SearchResultWidget({this.movies, this.people});

  @override
  Widget build(BuildContext context) {

    var data = isSearchingForMovies() ? movies : people;
    if (data != null) {
      return ListView.builder(
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) {
            return _buildContent(index, context);
          });
    }
    return Container();
  }

  bool isSearchingForMovies() => movies != null;

  Widget _buildContent(int index, BuildContext context) {
    if (isSearchingForMovies()) {
      return PosterRow(movies[index]);
    } else {
			TMDBPersonBasic person = people[index];
			var cast = Cast.fromJson(person.toJson());
      return InkWell(
				onTap: () {
					Router.pushPersonScreen(context, cast);
				},
        child: Hero(
						tag: "tag-${cast.id}",
            child: Material(
              child: SizedBox(
								height: 300.0,
                child: ListTile(
								title: Text(person.name),
                  subtitle: ImageLoader(
                    imagePath: person.profilePath,
                    imageType: IMAGE_TYPE.POSTER,
                    size: PROFILE_SIZE,
                  ),
                ),
              ),
            ),
          ),
      );
    }
  }
}
