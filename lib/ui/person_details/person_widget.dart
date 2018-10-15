import 'package:cine_reel/constants/api_constants.dart';
import 'package:cine_reel/models/tmdb_movie_details.dart';
import 'package:cine_reel/models/tmdb_person.dart';
import 'package:cine_reel/ui/common_widgets/blurred_image.dart';
import 'package:cine_reel/ui/common_widgets/common_widgets.dart';
import 'package:cine_reel/ui/common_widgets/loading_widget.dart';
import 'package:cine_reel/utils/image_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:transparent_image/transparent_image.dart';

class PersonWidget extends StatelessWidget {
  final TMDBPerson person;
  final Cast cast;
  final List<Widget> widgetsList = [];
  final bool showLoading;

  PersonWidget({Key key, this.person, this.cast, bool this.showLoading}) : super(key: key);
  final loadingWidget = LoadingWidget(
    visible: true,
  );

  @override
  Widget build(BuildContext context) {
    widgetsList.addAll([basicInfo(context), populatBio()]);

    if (showLoading) {
      widgetsList.add(loadingWidget);
    } else {
      widgetsList.remove(loadingWidget);
    }

    return Scaffold(
      body: DefaultTextStyle(
        child: BlurredImage(
          imagePath: cast.profilePath,
          child: buildContent(),
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

  Widget basicInfo(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        personName(),
        buildHorizontalDivider(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            avatar(),
            populateBirthday(context),
          ],
        ),
      ],
    );
  }

  Widget personName() {
    return Text(
      cast.name,
      style: TextStyle(fontSize: 23.0),
    );
  }

  Widget avatar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Hero(
        child: Material(
          color: Colors.transparent,
          child: rectangleAvatar(),
        ),
        tag: "tag-${cast.id}",
      ),
    );
  }

  Widget rectangleAvatar() {
    return Image(
        width: 180.0,
        image: _image(
          cast.profilePath,
        ));
  }

  Widget populatBio() {
    return AnimateChildren(
        childOne: biographyWidget(), childTwo: Container(), showHappyPath: person != null);
  }

  Widget biographyWidget() {
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

  Widget populateBirthday(BuildContext context) {
    return Expanded(
      child: AnimateChildren(
          childOne: birthdayWidget(), childTwo: Container(), showHappyPath: person != null),
    );
  }

  Widget birthdayWidget() {
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

  ImageProvider _image(String profilePath) {
    return FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image: ImageHelper.getCastFullProfilePath(profilePath, PROFILE_SIZES['large']))
        .image;
  }

  Widget basicPersonalDetails() {
    return Text(cast.character);
  }
}
