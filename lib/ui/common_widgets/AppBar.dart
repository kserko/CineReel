import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppBarWidget extends StatelessWidget {
  final String title;
  final List<Tab> myTabs;
  final TabController tabController;

	AppBarWidget(List<Tab> this.myTabs, String this.title, TabController this
			.tabController);

	@override
  Widget build(BuildContext context) {
			return AppBar(
				title: new Text(title),
				elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 3.0,
				bottom: TabBar(
						controller: tabController,
						tabs:myTabs)
		);
	}
}