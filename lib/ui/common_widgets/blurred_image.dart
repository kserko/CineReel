import 'dart:ui';

import 'package:cine_reel/constants/api_constants.dart';
import 'package:cine_reel/utils/image_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BlurredImage extends StatelessWidget {
  final String imagePath;
  final String imageSize;

  BlurredImage({@required this.imagePath, @required String this.imageSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(ImageHelper.getImagePath(imagePath, POSTER_SIZES[imageSize])),
              fit: BoxFit.fitHeight)),
      child: new BackdropFilter(
        //applying a blur filter on the image
        filter: ImageFilter.blur(sigmaX: 50.0, sigmaY: 50.0),
        child: new Container(
          decoration: new BoxDecoration(color: Colors.black.withOpacity(0.2)),
        ),
      ),
    );
  }
}
