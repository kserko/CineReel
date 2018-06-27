import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context, String title) {
  return new AppBar(
    title: new Text(title),
    elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 3.0,
  );
}

Widget buildLoadingWidget() {
  return Center(
    child: CircularProgressIndicator(),
  );
}

Widget buildErrorWidget(String error) {
  return Center(
    child: Text(error),
  );
}
