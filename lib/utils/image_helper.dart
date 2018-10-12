import 'package:cine_reel/constants/api_constants.dart';

class ImageHelper {
  static String getImagePath(String path, String size) {
    String fullPath = "";
    if (path != null) {
      fullPath = TMDB_BASE_IMAGE_URL + size + path;
    }
    return fullPath;
  }

  static String getCastFullProfilePath(String profilePath, String size) {
    String fullPath = "";
    fullPath = TMDB_BASE_IMAGE_URL + size + profilePath;
    return fullPath;
  }

  static String getPersonFullProfilePath(dynamic cast, String size) {
    String fullPath = "";
    if (cast != null && cast.profilePath != null) {
      fullPath = TMDB_BASE_IMAGE_URL + size + cast.profilePath;
    }
    return fullPath;
  }
}
