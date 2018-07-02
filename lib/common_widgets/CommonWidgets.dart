import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context, String title, List<Tab> myTabs, TabController tabController) {
  return new AppBar(
    title: new Text(title),
    elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 3.0,
    bottom: TabBar(
        controller: tabController,
        tabs:myTabs)
  );
}

Widget buildLoadingWidget() {
  return Center(
    child: CircularProgressIndicator(),
  );
}

Widget buildErrorWidget(String error) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(18.0),
      child: Text('Api returned with an error "$error"'),
    ),
  );
}
