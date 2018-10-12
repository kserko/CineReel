import 'package:cine_reel/constants/api_constants.dart';
import 'package:cine_reel/models/tmdb_person.dart';
import 'package:cine_reel/ui/common_widgets/common_widgets.dart';
import 'package:cine_reel/utils/image_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:transparent_image/transparent_image.dart';

class PersonWidget extends StatelessWidget {
  final bool visible;
  final TMDBPerson person;

  @override
  Widget build(BuildContext context) {
    return AnimateChildren(
        childOne: personDetails(), showHappyPath: person != null, childTwo: Container());
  }

  Widget personDetails() {
    return Hero(
      child: Material(
				color: Colors.transparent,
        child: CircleAvatar(
            child: Padding(
              padding: const EdgeInsets.only(top: 88.0),
            ),
            radius: 80.0,
            backgroundImage: person != null ? _image() : null),
      ), tag: "tag-${person.id}",
    );

//    return Center(
//        child: Text(visible ? person.biography: ""),
//      );
  }

  ImageProvider _image() {
    return FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image: ImageHelper.getPersonFullProfilePath(person, PROFILE_SIZES['medium']))
        .image;
  }

  PersonWidget({bool this.visible, this.person});
}
