import 'package:cine_reel/constants/api_constants.dart';
import 'package:cine_reel/models/tmdb_movie_details.dart';
import 'package:cine_reel/models/tmdb_person.dart';
import 'package:cine_reel/ui/common_widgets/blurred_image.dart';
import 'package:cine_reel/ui/common_widgets/common_widgets.dart';
import 'package:cine_reel/utils/image_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:transparent_image/transparent_image.dart';

class PersonWidget extends StatelessWidget {
  final TMDBPerson person;
  final Cast cast;
  final List<Widget> widgetsList = [];

  PersonWidget({Key key, this.person, this.cast}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    widgetsList.add(basicInfo());

    if (person != null) {
      widgetsList.addAll(
        [
          getBirthDetails(),
          buildHorizontalDivider(),
          getBiography(),
          buildHorizontalDivider(),
        ],
      );
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
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: widgetsList)),
            ],
          ),
        ),
      ],
    );
  }

  Widget basicInfo() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        personName(),
        buildHorizontalDivider(),
        avatar(),
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
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Hero(
          child: Material(
            color: Colors.transparent,
            child: rectangleAvatar(),
          ),
          tag: "tag-${cast.id}",
        ),
      ),
    );
  }

  Widget rectangleAvatar() {
    return Image(
        width: 230.0,
        image: _image(
          cast.profilePath,
        ));
  }

  Widget getBiography() {
    return Text(person.biography);
  }

  Widget getBirthDetails() {
    return Row(
      children: <Widget>[
        Text(
          person.formattedBirthday(),
        ),
      ],
    );
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
