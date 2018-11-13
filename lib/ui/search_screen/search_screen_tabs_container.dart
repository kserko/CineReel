import 'package:cine_reel/ui/tabs/tab_object.dart';
import 'package:cine_reel/utils/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchScreenTabsContainer extends StatefulWidget {
  @override
  _SearchScreenTabsContainerState createState() => _SearchScreenTabsContainerState();
}

class _SearchScreenTabsContainerState extends State<SearchScreenTabsContainer>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

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

    //when changing tabs this notifies each tab to update with the latest text input
		//We can avoid this warning by adding the ChangeNotifier mixin, but then
		//the super.dispose call calls the one in ChangeNotifier instead of the state
		//and throws an exception _SearchScreenTabsContainerState.dispose failed to call super.dispose.
		//This is probably a bug in Flutter so I raised it https://github.com/flutter/flutter/issues/24293

		// ignore: invalid_use_of_protected_member
    textController.notifyListeners();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: buildSearchTextField(),
          bottom: TabBar(
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
}