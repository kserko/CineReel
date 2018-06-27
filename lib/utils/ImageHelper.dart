
import 'package:flutter_bloc_movies/Constants.dart';

class ImageHelper {
  static String getBackdropImagePath(String path, String size) {
    String fullPath = "";
    if (path != null) {
      fullPath = BASE_IMAGE_URL + size + path;
    }
    return fullPath;
  }
}
