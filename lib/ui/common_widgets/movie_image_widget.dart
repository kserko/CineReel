import 'package:flutter/widgets.dart';
import 'package:flutter_advanced_networkimage/flutter_advanced_networkimage.dart';
import 'package:flutter_advanced_networkimage/transition_to_image.dart';
import 'package:flutter_bloc_movies/models/Movie.dart';
import 'package:flutter_bloc_movies/utils/ImageHelper.dart';
import 'package:transparent_image/transparent_image.dart';

enum IMAGE_TYPE {POSTER, BACKDROP}

class MovieImage extends StatelessWidget {
  final IMAGE_TYPE imageType;
  final Movie movie;
  final String size;

	MovieImage({this.movie, this.imageType, this.size});

  @override
  Widget build(BuildContext context) {
//		return getAdvancedNetworkImage();
	return getFadeInImage();
  }

  Widget getFadeInImage() {
  	return FadeInImage.memoryNetwork(placeholder: kTransparentImage, image: getImagePath());
	}

	Widget getAdvancedNetworkImage() {
		return new TransitionToImage(AdvancedNetworkImage(getImagePath()),
				useReload: false, fallbackWidget: SizedBox(height: 300.0));
	}

	String getImagePath() {
  	switch (imageType) {
			case IMAGE_TYPE.POSTER:
				return ImageHelper.getImagePath(movie.posterPath, size);
			case IMAGE_TYPE.BACKDROP:
				return ImageHelper.getImagePath(movie.backdropPath, size);
		}
	}

}