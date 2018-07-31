import 'package:cine_reel/navigation/router.dart';
import 'package:cine_reel/ui/info_view/info_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget getDotSeparator() {
  return Text("·", style: TextStyle(fontSize: 23.0));
}

Widget getAppBar({title, context, tabController, myTabs}) {
  return AppBar(
      actions: buildActions(context),
      title: new Text(title),
      elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 3.0,
      bottom: TabBar(controller: tabController, tabs: myTabs));
}

List<Widget> buildActions(context) {
  return <Widget>[
    searchAction(context),
		infoAction(context)
  ];
}

IconButton searchAction(context) {
  return IconButton(
      icon: Icon(Icons.search),
      onPressed: () => Router.pushSearchScreen(context));
}

IconButton infoAction(context) {
	return IconButton(
			icon: Icon(Icons.info_outline),
			onPressed: () => showModalBottomSheet(context: context, builder:(BuildContext context) =>
					InfoView()));
}

Widget buildHorizontalDivider({double height = 22.0}) {
  return Divider(height: height);
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
