import 'package:cine_reel/constants/api_constants.dart';
import 'package:cine_reel/ui/common_widgets/image_loader.dart';
import 'package:flutter/material.dart';

class MovieDetailsBackdropWidget extends StatelessWidget {
	final String backdropPath;

	MovieDetailsBackdropWidget({@required this.backdropPath});

	@override
	Widget build(BuildContext context) {
		return Column(
			children: <Widget>[
				ClipPath(
					clipper: BackdropClipper(),
					child: ImageLoader(
						imageType: IMAGE_TYPE.BACKDROP,
						imagePath: backdropPath,
						size: POSTER_SIZE,
					),
				)
			],
		);
	}
}

class BackdropClipper extends CustomClipper<Path> {
	@override
	Path getClip(Size size) {
		var path = Path();
		var clipHeight = 30.0;
		var startPoint = Offset(0.0, size.height - clipHeight);
		var controlPoint = Offset(size.width / 2, size.height);
		var endPoint = Offset(size.width, size.height - clipHeight);

		path.lineTo(startPoint.dx, startPoint.dy);
		path.quadraticBezierTo(controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy);
		path.lineTo(size.width, 0.0); //top right corner
		path.close();

		return path;
	}

	@override
	bool shouldReclip(CustomClipper<Path> oldClipper) {
		return false;
	}
}