import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_advanced_networkimage/flutter_advanced_networkimage.dart';
import 'package:flutter_advanced_networkimage/transition_to_image.dart';
import 'package:flutter_bloc_movies/Constants.dart';
import 'package:flutter_bloc_movies/utils/ImageHelper.dart';


class MovieImageFullScreen extends StatelessWidget {
  final IMAGE_TYPE imageType;
  final String size;
  final String imagePath;
  final Widget overlayContent;

  MovieImageFullScreen({this.imagePath, this.imageType, this.size, Widget this.overlayContent});

  @override
  Widget build(BuildContext context) {
		return Hero(child: getBlurredImage(), tag: imagePath);
	}

  Widget getBlurredImage() {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  ImageHelper.getImagePath(imagePath, POSTER_SIZES['small'])),
              fit: BoxFit.fitHeight)),
      child: new BackdropFilter(
        //applying a blur filter on the image
        filter: new ImageFilter.blur(sigmaX: 50.0, sigmaY: 50.0),
        child: new Container(
          decoration: new BoxDecoration(color: Colors.black.withOpacity(0.2)),
		child: overlayContent,
        ),
      ),
    );
  }

  Widget getAdvancedNetworkImage() {
    return new TransitionToImage(
        AdvancedNetworkImage(ImageHelper.getImagePath(imagePath, size)),
        useReload: false,
        fallbackWidget: SizedBox(height: 300.0));
  }
}
