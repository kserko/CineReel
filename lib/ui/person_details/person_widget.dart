import 'package:cine_reel/constants/api_constants.dart';
import 'package:cine_reel/models/tmdb_movie_details.dart';
import 'package:cine_reel/models/tmdb_person.dart';
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
    return Scaffold(
        appBar: AppBar(
          title: personName(),
        ),
        body: Column(children: builder));
  }

  Widget basicInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        avatar(),
      ],
    );
  }

  Widget personName() {
    return Text(cast.name, style: TextStyle(fontSize: 23.0),);
  }

  Widget avatar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Hero(
        child: Material(
          color: Colors.transparent,
          child: CircleAvatar(
              radius: 100.0,
              backgroundImage: _image(cast.profilePath)),
        ),
        tag: "tag-${cast.profilePath}",
      ),
    );

//    return Center(
//        child: Text(visible ? person.biography: ""),
//      );
  }

  ImageProvider _image(String profilePath) {
    return FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image: ImageHelper.getCastFullProfilePath(profilePath, PROFILE_SIZES['large']))
        .image;
  }
}
