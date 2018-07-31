
import 'package:cine_reel/Constants.dart';
import 'package:cine_reel/models/tmdb_movie_details.dart';

class ImageHelper {
  static String getImagePath(String path, String size) {
    String fullPath = "";
    if (path != null) {
      fullPath = TMDB_BASE_IMAGE_URL + size + path;
    }
    return fullPath;
  }

  static String getCastFullProfilePath(Cast cast, String size,) {
  	String fullPath = "";
		if (cast != null && cast.profilePath != null) {
			fullPath = TMDB_BASE_IMAGE_URL + size + cast.profilePath;
		}
		return fullPath;
	}
}
