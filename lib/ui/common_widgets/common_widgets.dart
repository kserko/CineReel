import 'dart:ui';

import 'package:cine_reel/navigation/router.dart';
import 'package:cine_reel/ui/info_view/info_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const double INDENT = 10.0;

Widget getDotSeparator() {
  return Text("·", style: TextStyle(fontSize: 23.0));
}

Widget getAppBar({title, context, tabController, myTabs}) {
  return AppBar(
      actions: buildActions(context),
      title: new Text(title),
      elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 3.0,
      bottom: TabBar(
        controller: tabController,
        tabs: myTabs,
        isScrollable: true,
        indicatorWeight: 1.0,
      ));
}

List<Widget> buildActions(context) {
  return <Widget>[searchAction(context), infoAction(context)];
}

IconButton searchAction(context) {
  return IconButton(
      icon: Icon(Icons.search),
      onPressed: () => Router.goToSearchScreen(context));
}

IconButton infoAction(context) {
  return IconButton(
      icon: Icon(Icons.info_outline),
      onPressed: () => showModalBottomSheet(
          context: context, builder: (BuildContext context) => InfoView()));
}

Widget buildHorizontalDivider(context,
    {double height = 22.0, Color color = Colors.white, double leftIndent = INDENT, double rightIndent = INDENT}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Container(
        width: MediaQuery.of(context).size.width,
        color: color,
        height: 0.3,
        margin: EdgeInsets.only(left: leftIndent, right: rightIndent)),
  );
}

Widget buildDetailSubtitle(String subtitle) {
  return Column(
    children: <Widget>[
      Padding(padding: EdgeInsets.only(top: 30.0)),
      Text(
        subtitle,
        style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
      ),
    ],
  );
}

Widget MaterialIcon(String assetPath, [Function onPressedAction]) {
  return Material(
      color: Colors.transparent,
      child: IconButton(
        icon: Image(image: AssetImage(assetPath)),
        onPressed: () => onPressedAction(),
      ));
}

AnimatedCrossFade CrossFadeWidgets(
    {@required Widget childOne,
    @required Widget childTwo,
    @required bool showChildOne}) {
  return AnimatedCrossFade(
    alignment: Alignment.center,
    firstChild: childOne,
    secondChild: childTwo,
    duration: Duration(milliseconds: 300),
    crossFadeState:
        showChildOne ? CrossFadeState.showFirst : CrossFadeState.showSecond,
  );
}
