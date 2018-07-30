import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc_movies/navigation/router.dart';

Widget getDotSeparator() {
  return Text("·", style: TextStyle(fontSize: 23.0));
}

Widget getAppBar({title, context, tabController, myTabs}) {
  return AppBar(
      actions: goToSearchPage(context),
      title: new Text(title),
      elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 3.0,
      bottom: TabBar(controller: tabController, tabs: myTabs));
}

List<Widget> goToSearchPage(context) {
  return <Widget>[
    IconButton(
        icon: Icon(Icons.search),
        onPressed: () => Router.pushSearchScreen(context)),
  ];
}

Widget buildHorizontalDivider() {
  return Divider(height: 22.0);
}

Widget MaterialIcon(String assetPath) {
  return Material(
      color: Colors.transparent,
      child: IconButton(
        icon: Image(image: AssetImage(assetPath)),
        onPressed: () {},
      ));
}

AnimatedCrossFade AnimateChildren(
    {@required Widget childOne, @required Widget childTwo, @required bool showHappyPath}) {
  return AnimatedCrossFade(
    firstChild: childOne,
    secondChild: childTwo,
    duration: Duration(milliseconds: 300),
    crossFadeState: showHappyPath ? CrossFadeState.showFirst : CrossFadeState.showSecond,
  );
}
