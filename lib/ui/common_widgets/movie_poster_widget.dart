import 'package:cine_reel/constants/api_constants.dart';
import 'package:cine_reel/ui/common_widgets/common_widgets.dart';
import 'package:cine_reel/utils/image_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:transparent_image/transparent_image.dart';

class MoviePosterWidget extends StatelessWidget {
  final IMAGE_TYPE imageType;
  final String size;
  final String imagePath;
  final int id;

  MoviePosterWidget({this.id, this.imagePath, this.imageType, this.size});

  @override
  Widget build(BuildContext context) {
    return Hero(child: _buildImage(context), tag: "$id-imagePath");
  }

  _buildImage(BuildContext context) {
    var fadedImage = FadeInImage.memoryNetwork(
        placeholder: kTransparentImage,
        image: ImageHelper.getImagePath(imagePath, POSTER_SIZES[size]),
        fit: BoxFit.fitWidth);

    return AnimateChildren(
        childOne: fadedImage, childTwo: SizedBox(width: 100.0), showHappyPath: fadedImage != null);
  }
}
