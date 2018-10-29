import 'package:cine_reel/constants/api_constants.dart';
import 'package:cine_reel/models/tmdb_movie_credits.dart';
import 'package:cine_reel/models/tmdb_movie_details.dart';
import 'package:cine_reel/models/tmdb_person.dart';
import 'package:cine_reel/navigation/router.dart';
import 'package:cine_reel/ui/common_widgets/blurred_image.dart';
import 'package:cine_reel/ui/common_widgets/common_widgets.dart';
import 'package:cine_reel/ui/common_widgets/errors_widget.dart';
import 'package:cine_reel/ui/common_widgets/image_loader.dart';
import 'package:cine_reel/ui/common_widgets/loading_widget.dart';
import 'package:cine_reel/ui/common_widgets/movie_poster_widget.dart';
import 'package:cine_reel/utils/helper_functions.dart';
import 'package:cine_reel/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const String MOVIE_POSTER_SIZE = SIZE_LARGE;

class PersonWidget extends StatelessWidget {
  final TMDBPerson person;
  final Cast cast;
  final List<Widget> widgetsList = [];
  final bool showLoading;
  final String errorMessage;

  PersonWidget({Key key, this.person, this.cast, bool this.showLoading, this.errorMessage}) :
				super(key: key);
  final loadingWidget = LoadingWidget(
    visible: true,
  );

  @override
  Widget build(BuildContext context) {
    widgetsList
        .addAll([_populateBasicInfo(context), _populateBio(), _populateFilmography(context)]);

    if (errorMessage.isNotEmpty) {
    	widgetsList.add(ErrorsWidget(visible: true, error: errorMessage,));
		}
    if (showLoading) {
      widgetsList.add(loadingWidget);
    } else {
      widgetsList.remove(loadingWidget);
    }

    return Scaffold(
      body: DefaultTextStyle(
        child: Stack(
          children: <Widget>[
            BlurredImage(
              imageSize: SIZE_SMALL,
              imagePath: cast.profilePath,
            ),
            buildContent(),
          ],
        ),
        style: TextStyle(fontSize: 14.0),
      ),
    );
  }

  Widget buildContent() {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView(
            children: [
              Container(
                  margin: const EdgeInsets.only(top: 45.0),
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(children: widgetsList)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _populateBasicInfo(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        personName(),
        buildHorizontalDivider(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _buildProfilePicture(),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  _buildIMDBLink(),
                  _populateBirthday(context),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget personName() {
    return Text(
      cast.name,
      style: STYLE_TITLE,
    );
  }

  Widget _buildProfilePicture() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Hero(
        child: Material(
          color: Colors.transparent,
          child: _loadProfilePicture(),
        ),
        tag: "tag-${cast.id}",
      ),
    );
  }

  Widget _loadProfilePicture() {
    return SizedBox(
      width: 180.0,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: ImageLoader(
          imagePath: cast.profilePath,
          imageType: IMAGE_TYPE.PROFILE,
          size: PROFILE_SIZE,
        ),
      ),
    );
  }

  Widget _buildIMDBLink() {
    return AnimateChildren(
        childOne: SizedBox.fromSize(
          size: Size.fromHeight(80.0),
          child: MaterialIcon("assets/imdb_icon.png", _launchIMDBUrl),
        ),
        childTwo: Container(),
        showHappyPath: person != null);
  }

  _launchIMDBUrl() {
    var url = "$IMDB_PERSON_PAGE_BASE_URL/${person.imdbId}";
    return launchURL(url);
  }

  Widget _populateBio() {
    return AnimateChildren(
        childOne: _buildBiographyWidget(), childTwo: Container(), showHappyPath: person != null);
  }

  Widget _buildBiographyWidget() {
    bool hasBiography = person?.hasBiography() ?? false;
    if (hasBiography) {
      return Column(
        children: <Widget>[
          Text(person.biography),
          buildHorizontalDivider(),
        ],
      );
    }
    return Container();
  }

  Widget _populateBirthday(BuildContext context) {
    return AnimateChildren(
        childOne: _buildBirthdayWidget(), childTwo: Container(), showHappyPath: person != null);
  }

  Widget _buildBirthdayWidget() {
    bool hasBirthdayDetails = person?.hasBirthdayDetails() ?? false;

    if (hasBirthdayDetails) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            buildHorizontalDivider(),
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(person.getFormattedBirthday(),
                      style: TextStyle(
                        inherit: true,
                        fontSize: 16.0,
                      )),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 8.0),
              child: Text(
                person.getPlaceOfBirth(),
                style: TextStyle(
                  inherit: true,
                  fontSize: 16.0,
                ),
              ),
            ),
            buildHorizontalDivider(),
          ],
        ),
      );
    }
    return Container();
  }

  Widget _populateFilmography(BuildContext context) {
    return AnimateChildren(
      childOne: _buildFilmography(context),
      childTwo: Container(),
      showHappyPath: person != null,
    );
  }

  Widget _buildFilmography(BuildContext context) {
    var filmographyHeight = MediaQuery.of(context).size.height * 0.35;

    bool hasMovieDetails = person?.hasMovieCredits() ?? false;
    if (hasMovieDetails) {
      var movieCredits = person.movieCredits.getSortedMovieCreditsAsCast();
      return SizedBox(
        height: filmographyHeight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildFilmographySubtitle(),
            _buildFilmographyList(movieCredits, filmographyHeight),
            buildHorizontalDivider(),
          ],
        ),
      );
    }
    return Container();
  }

  Expanded _buildFilmographyList(List<MovieCreditsAsCast> movieCredits, double movieCreditHeight) {
    return Expanded(
      child: ListView.builder(
        itemCount: movieCredits.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: ((BuildContext context, int index) {
          return _buildMoviePoster(movieCredits[index], movieCreditHeight, context);
        }),
      ),
    );
  }

  Padding _buildFilmographySubtitle() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        "Filmography",
        style: STYLE_SUBTITLE,
      ),
    );
  }

  Widget _buildMoviePoster(
      MovieCreditsAsCast movieCredit, double movieCreditHeight, BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            margin: EdgeInsets.all(3.0),
            child: SizedBox(
              height: movieCreditHeight,
              child: Material(
                child: InkWell(
                  onTap: () => Router.pushDetailsScreen(
                      context, movieCredit.convertToTMDBMovieBasic(), MOVIE_POSTER_SIZE),
                  child: MoviePosterWidget(
                    id: movieCredit.id,
                    imagePath: movieCredit.posterPath,
                    imageType: IMAGE_TYPE.POSTER,
                    size: MOVIE_POSTER_SIZE,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
