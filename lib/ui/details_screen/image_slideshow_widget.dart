import 'package:cine_reel/constants/api_constants.dart';
import 'package:cine_reel/models/tmdb_movie_details.dart';
import 'package:cine_reel/ui/common_widgets/image_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ImageSlideshowWidget extends StatefulWidget {
  final List<TMDBImage> images;
  final int startingIndex;

  ImageSlideshowWidget({List<TMDBImage> this.images, this.startingIndex});

  @override
  ImageSlideshowWidgetState createState() {
    return new ImageSlideshowWidgetState();
  }
}

class ImageSlideshowWidgetState extends State<ImageSlideshowWidget> {
  PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: widget.startingIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: PageView.builder(
          controller: pageController,
          itemCount: widget.images.length - 1,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            String imagePath = widget.images[index + 1].filePath; //index+1 to ignore first image as
            return Center(
              child: Hero(
                child: ImageLoader(
                  imageType: IMAGE_TYPE.BACKDROP,
                  imagePath: imagePath,
                  size: BACKDROP_SIZES[SIZE_LARGE],
                ),
                tag: "$imagePath + $index}",
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    print('disposing slideshow');
  }
}
