
import 'package:flutter_bloc_movies/Constants.dart';

class ImageHelper {
  static String getImagePath(String path, String size) {
    String fullPath = "";
    if (path != null) {
      fullPath = TMDB_BASE_IMAGE_URL + size + path;
    }
    return fullPath;
  }
}
