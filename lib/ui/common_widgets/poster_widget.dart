import 'package:cine_reel/constants/api_constants.dart';
import 'package:cine_reel/ui/common_widgets/common_widgets.dart';
import 'package:cine_reel/ui/common_widgets/image_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PosterWidget extends StatelessWidget {
	final IMAGE_TYPE imageType;
	final String size;
	final String imagePath;
	final int id;
	final BoxFit boxFit;
	final bool animate;

	PosterWidget({
		@required this.id,
		@required this.imagePath,
		@required this.imageType,
		@required this.size,
		@required this.boxFit,
		this.animate = true,
	});

	@override
	Widget build(BuildContext context) {
		return Hero(child: _buildImage(context), tag: "$id-imagePath");
	}

	Widget _buildImage(BuildContext context) {
		var image = ImageLoader(imagePath: imagePath,
				imageType: imageType,
				size: getImageSize(),
				boxFit: boxFit,
				animate: false);

		if (animate) {
			return AnimateChildren(
					childOne: image,
					childTwo: SizedBox(width: 100.0),
					showHappyPath: image != null);
		} else {
			return image;
		}
	}

	String getImageSize() {
		if (imageType == IMAGE_TYPE.POSTER) {
			return POSTER_SIZES[size];
		}
		if (imageType == IMAGE_TYPE.PROFILE) {
			return PROFILE_SIZES[size];
		}
		return null;
	}
}