import 'package:flutter/material.dart';

class SearchIntro extends StatelessWidget {
  final bool visible;
  final bool isSearchingMovies;

  const SearchIntro({Key key, this.visible, this.isSearchingMovies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 300),
      opacity: visible ? 1.0 : 0.0,
      child: Container(
        alignment: FractionalOffset.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.info, color: Theme.of(context).accentColor, size: 80.0),
            Container(
              padding: EdgeInsets.only(top: 16.0),
              child: buildText(),
            )
          ],
        ),
      ),
    );
  }

  Text buildText() {
  	String text = isSearchingMovies ? "Enter a movie title to begin" : "Enter a person name to begin";
    return Text(
      text,
      style: TextStyle(
        color: Colors.green[100],
      ),
    );
  }
}
