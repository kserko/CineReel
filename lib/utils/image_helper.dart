import 'package:cine_reel/constants/api_constants.dart';
import 'package:flutter/widgets.dart';
import 'package:transparent_image/transparent_image.dart';

class ImageHelper {
  static String getImagePath(String path, String size) {
    if (path != null) {
      return TMDB_BASE_IMAGE_URL + size + path;
    }
    return "";
  }

  static String getCastFullProfilePath(String profilePath, String size) {
		if (profilePath != null) {
			return TMDB_BASE_IMAGE_URL + size + profilePath;
		}
		return "";
  }
}

ImageProvider image(String profilePath) {
	return FadeInImage.memoryNetwork(
			placeholder: kTransparentImage,
			image: ImageHelper.getCastFullProfilePath(profilePath, PROFILE_SIZES['large']))
			.image;
}

