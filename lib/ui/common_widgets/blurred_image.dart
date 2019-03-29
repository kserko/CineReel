import 'dart:ui';

import 'package:cine_reel/constants/api_constants.dart';
import 'package:cine_reel/utils/image_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BlurredImage extends StatelessWidget {
  final String imagePath;
  final String imageSize;
  final Animation<double> posterBlur;
  final String id;

  BlurredImage({
		@required this.id,
		@required this.imagePath,
    @required this.imageSize,
    @required this.posterBlur,
  });

  @override
  Widget build(BuildContext context) {
  	double blurValue = posterBlur?.value ?? 25.0;
    return Hero(
      flightShuttleBuilder: (
        BuildContext flightContext,
        Animation<double> animation,
        HeroFlightDirection flightDirection,
        BuildContext fromHeroContext,
        BuildContext toHeroContext,
      ) {
        final Hero toHero = toHeroContext.widget;
        return SizeTransition(
          sizeFactor: animation,
          child: toHero.child,
        );
      },
      tag: imagePath,
      child: Material(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(ImageHelper.getImagePath(imagePath, POSTER_SIZES[imageSize])),
                  fit: BoxFit.fitHeight)),
          child: new BackdropFilter(
            //applying a blur filter on the image
            filter: ImageFilter.blur(sigmaX: blurValue, sigmaY: blurValue),
            child: new Container(
              decoration: new BoxDecoration(color: Colors.black.withOpacity(0.2)),
            ),
          ),
        ),
      ),
    );
  }
}
