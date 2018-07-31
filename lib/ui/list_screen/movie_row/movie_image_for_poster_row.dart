import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc_movies/Constants.dart';
import 'package:flutter_bloc_movies/utils/ImageHelper.dart';
import 'package:transparent_image/transparent_image.dart';

class MovieImageForRow extends StatelessWidget {
  final IMAGE_TYPE imageType;
  final String size;
  final String imagePath;
  final int movieId;

  MovieImageForRow({this.movieId, this.imagePath, this.imageType, this.size});

  @override
  Widget build(BuildContext context) {
		return Hero(child: getFadeInImage(), tag: "$movieId-imagePath");
  }

  Widget getFadeInImage() {
    return FadeInImage.memoryNetwork(
        placeholder: kTransparentImage,
        image: ImageHelper.getImagePath(imagePath, size),
        fit: BoxFit.fitWidth);
  }
}
