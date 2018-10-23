import 'package:cine_reel/constants/api_constants.dart';
import 'package:cine_reel/ui/common_widgets/common_widgets.dart';
import 'package:cine_reel/utils/image_helper.dart';
import 'package:flutter/widgets.dart';

class ImageLoader extends StatefulWidget {
  final String imagePath;
  final IMAGE_TYPE imageType;
  final String size;

  ImageLoader({@required this.imagePath, @required this.imageType, @required String this.size});

  @override
  _ImageLoaderState createState() => _ImageLoaderState();
}

class _ImageLoaderState extends State<ImageLoader> {
  bool _loaded = false;
  var image;

  //placeholder source - https://www.iconfinder.com/icons/2202250/account_avatar_human_man_profile_icon
  var placeholder = Image(image: AssetImage("assets/avatar_placeholder.png"));

  @override
  void initState() {
    _loadImage();

    image?.image?.resolve(ImageConfiguration())?.addListener((i, b) {
      mounted
          ? setState(() {
              _loaded = true;
            })
          : null;
    });
    super.initState();
  }

  void _loadImage() {
    image = placeholder;
    String imageSize = "original"; //default
    switch (widget.imageType) {
      case IMAGE_TYPE.PROFILE:
      	imageSize = PROFILE_SIZES[widget.size];
        break;
      case IMAGE_TYPE.POSTER:
				imageSize = POSTER_SIZES[widget.size];
        break;
      case IMAGE_TYPE.BACKDROP:
				imageSize = BACKDROP_SIZES[widget.size];
				break;
    }

		image = Image.network(
			ImageHelper.getImagePath(
				widget.imagePath,
				imageSize,
			),
		);

	}

  @override
  Widget build(BuildContext context) {
    return AnimateChildren(
      childOne: image,
      childTwo: widget.imageType == IMAGE_TYPE.PROFILE
          ? placeholder
          : SizedBox(
              width: 10.0,
              height: 100.0,
            ),
      showHappyPath: _loaded,
    );
  }
}
