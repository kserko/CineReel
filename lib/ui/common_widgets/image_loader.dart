import 'package:cine_reel/constants/api_constants.dart';
import 'package:cine_reel/utils/image_helper.dart';
import 'package:flutter/widgets.dart';

class ImageLoader extends StatefulWidget {
  final String imagePath;

  ImageLoader(String this.imagePath);

  @override
  _ImageLoaderState createState() => _ImageLoaderState(imagePath);
}

class _ImageLoaderState extends State<ImageLoader> {
  bool _loaded = false;
  var placeholder = Image(image: AssetImage("assets/avatar_placeholder.png"));
	var img;

  _ImageLoaderState(String imagePath) {
		img = Image.network(ImageHelper.getCastFullProfilePath(imagePath, PROFILE_SIZES['large']));
	}

  @override
  void initState() {
    img.image.resolve(ImageConfiguration()).addListener((i, b) {
      mounted
          ? setState(() {
              _loaded = true;
            })
          : null;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (!_loaded) {
    	return placeholder;
		}
    	return img;
  }
}
