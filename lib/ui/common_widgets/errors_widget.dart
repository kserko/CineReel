import 'package:flutter/material.dart';

class ErrorsWidget extends StatelessWidget {
  final bool visible;

  final error;

  const ErrorsWidget({Key key, this.visible, this.error}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 300),
      opacity: visible ? 1.0 : 0.0,
      child: Container(
        alignment: FractionalOffset.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.error_outline, color: Colors.red[300], size: 80.0),
            Container(
              padding: EdgeInsets.only(top: 16.0),
              child: Text(
                error.toString(),
                style: TextStyle(
                  color: Colors.red[300],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
