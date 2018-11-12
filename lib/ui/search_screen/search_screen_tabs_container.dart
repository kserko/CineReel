import 'package:cine_reel/ui/tabs/tab_object.dart';
import 'package:cine_reel/utils/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchScreenTabsContainer extends StatefulWidget {
  @override
  _SearchScreenTabsContainerState createState() => _SearchScreenTabsContainerState();
}

class _SearchScreenTabsContainerState extends State<SearchScreenTabsContainer> with SingleTickerProviderStateMixin {
  TabController _tabController;
  int activeTab = 0;

  TextEditingController textController = TextEditingController();
  TextField textField;

  TabBarView tabBarView;

  TabObject moviesTab;
  TabObject peopleTab;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 2);
    _tabController.addListener(_handleTabSelection);

		moviesTab = TabObject(TabKey.kSearchMovies, getMovieSearchProvider(textController));
		peopleTab = TabObject(TabKey.kSearchPeople, getPeopleSearchProvider(textController));

		tabBarView = TabBarView(
			controller: _tabController,
			children: [
				moviesTab.provider,
				peopleTab.provider,
			],
		);
  }

  void _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      return;
    }
    activeTab = _tabController.index;

    print("Changed tab to: ${_tabController.index.toString()}");
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

		print("build search screen");
    return Scaffold(
        appBar: AppBar(
          title: buildSearchTextField(),
          bottom: TabBar(
            isScrollable: true,
            indicatorSize: TabBarIndicatorSize.tab,
            controller: _tabController,
            indicatorWeight: 3.0,
            tabs: [
							moviesTab.tab,
							peopleTab.tab,
            ],
          ),
        ),
        body: tabBarView);
  }

  bool onMoviesTab() => activeTab == 0;

  Widget buildSearchTextField() {
    textField = TextField(
      controller: textController,
      autofocus: true,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: 'search TMDB...',
      ),
      style: TextStyle(
        fontSize: 26.0,
        fontFamily: "Hind",
        decoration: TextDecoration.none,
      ),
    );
    return textField;
  }

  bool onPeoplesTab() {
    return activeTab == 1;
  }
}