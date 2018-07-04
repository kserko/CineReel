import 'package:flutter/material.dart';
import 'package:flutter_bloc_movies/models/Movie.dart';
import 'package:flutter_bloc_movies/ui/movie_row.dart';

class SearchResultWidget extends StatelessWidget {
  final List<Movie> items;
  final bool visible;

	SearchResultWidget({Key key, @required this.items, bool visible})
			: this.visible = visible ?? items.isNotEmpty, super(key: key) {

	}

		@override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 800),
      opacity: visible ? 1.0 : 0.0,
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
					return MovieRow(item, index);
//          return InkWell(
////            onTap: () => showItem(context, item),
//            child: Container(
//              alignment: FractionalOffset.center,
//              margin: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 12.0),
//              child: Row(
//                crossAxisAlignment: CrossAxisAlignment.start,
//                children: <Widget>[
//                  Container(
//                    margin: EdgeInsets.only(right: 16.0),
//                    child: Hero(
//                      tag: item.title,
//                      child: ClipOval(
//                        child: Image.network(
//                          ImageHelper.getBackdropImagePath(
//                            item.backdropPath, BACKTROP_SIZES['medium']),
//                          width: 56.0,
//                          height: 56.0,
//                        ),
//                      ),
//                    ),
//                  ),
//                  Expanded(
//                    child: Column(
//                      crossAxisAlignment: CrossAxisAlignment.start,
//                      children: <Widget>[
//                        Container(
//                          margin: EdgeInsets.only(
//                            top: 6.0,
//                            bottom: 4.0,
//                          ),
//                          child: Text(
//                            "${item.overview}",
//                            maxLines: 1,
//                            overflow: TextOverflow.ellipsis,
//                            style: TextStyle(
//                              fontFamily: "Montserrat",
//                              fontSize: 16.0,
//                              fontWeight: FontWeight.bold,
//                            ),
//                          ),
//                        ),
//                        Container(
//                          child: Text(
//                            "${item.voteAverage}",
//                            style: TextStyle(
//                              fontFamily: "Hind",
//                            ),
//                            maxLines: 1,
//                            overflow: TextOverflow.ellipsis,
//                          ),
//                        )
//                      ],
//                    ),
//                  )
//                ],
//              ),
//            ),
//          );
        },
      ),
    );
  }

//  void showItem(BuildContext context, Movie item) {
//    Navigator.push(
//      context,
//      MaterialPageRoute<Null>(
//        builder: (BuildContext context) {
//          return Scaffold(
//            resizeToAvoidBottomPadding: false,
//            body: GestureDetector(
//              key: Key(item.backdropPath),
//              onTap: () => Navigator.pop(context),
//              child: SizedBox.expand(
//                child: Hero(
//                  tag: item.title,
//                  child: Image.network(
//                    item.posterPath,
//                    width: MediaQuery.of(context).size.width,
//                    height: 300.0,
//                  ),
//                ),
//              ),
//            ),
//          );
//        },
//      ),
//    );
//  }
}
