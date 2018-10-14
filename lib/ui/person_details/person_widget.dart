import 'package:cine_reel/constants/api_constants.dart';
import 'package:cine_reel/models/tmdb_movie_details.dart';
import 'package:cine_reel/models/tmdb_person.dart';
import 'package:cine_reel/ui/common_widgets/common_widgets.dart';
import 'package:cine_reel/utils/image_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:transparent_image/transparent_image.dart';

class PersonWidget extends StatelessWidget {
  final TMDBPerson person;
  final Cast cast;
  final List<Widget> builder = [];

  PersonWidget({Key key, this.person, this.cast}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    builder..add(basicInfo());

    if (person != null) {
      builder.add(getBiography());
    }

    return Scaffold(
        appBar: AppBar(
          title: personName(),
        ),
        body: Column(children: builder));
  }

  Widget basicInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        avatar(),
				basicPersonalDetails(),
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
        tag: "tag-${cast.profilePath}",
      ),
    );
  }

  Widget rectangleAvatar() {
    return Image(
        width: 200.0,
        image: _image(
          cast.profilePath,
        ));
  }

  CircleAvatar circleAvatar() =>
      CircleAvatar(radius: 100.0, backgroundImage: _image(cast.profilePath));

  Widget getBiography() {
    return AnimateChildren(
        childOne: Text(person.biography), childTwo: Container(), showHappyPath: person != null);
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
