import 'package:cine_reel/api/tmdb_api.dart';
import 'package:cine_reel/bloc/now_playing_bloc.dart';
import 'package:cine_reel/bloc/popular_bloc.dart';
import 'package:cine_reel/bloc/top_rated_bloc.dart';
import 'package:cine_reel/bloc_providers/movie_provider.dart';
import 'package:cine_reel/ui/common_widgets/common_widgets.dart';
import 'package:cine_reel/ui/list_screen/movies_list_screen.dart';
import 'package:cine_reel/utils/tab_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TabObject {
  Tab tab;
  MovieProvider movieProvider;

  TabObject({this.tab, this.movieProvider});
}

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({Key key, this.title}) : super(key: key);

  @override
  _MyTabbedPageState createState() => new _MyTabbedPageState(title);
}

class _MyTabbedPageState extends State<HomePage> with SingleTickerProviderStateMixin {
  List<TabObject> myTabs;
  TabController _tabController;
  TabBarView tabBarView;
  int activeTab = 0;
  final String title;

  final nowPlayingTab = TabObject(
      tab: Tab(text: tab[TabKey.kNowPlaying]),
      movieProvider: MovieProvider(
          child: MoviesListScreen(tabKey: TabKey.kNowPlaying),
          movieBloc: NowPlayingBloc(TMDBApi())));

  final topRatedTab = TabObject(
      tab: Tab(text: tab[TabKey.kTopRated]),
      movieProvider: MovieProvider(
          child: MoviesListScreen(tabKey: TabKey.kTopRated), movieBloc: TopRatedBloc(TMDBApi())));

  final popularTab = TabObject(
      tab: Tab(text: tab[TabKey.kPopular]),
      movieProvider: MovieProvider(
          child: MoviesListScreen(tabKey: TabKey.kPopular), movieBloc: PopularBloc(TMDBApi())));

  _MyTabbedPageState(this.title);

  @override
  void initState() {
    super.initState();
    myTabs = <TabObject>[nowPlayingTab, popularTab, topRatedTab];
    _tabController = new TabController(vsync: this, length: myTabs.length);
    _tabController.addListener(_handleTabSelection);
    tabBarView = TabBarView(controller: _tabController, children: [
    	myTabs[0].movieProvider,
      myTabs[1].movieProvider,
			myTabs[2].movieProvider
    ]);
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
    _tabController.dispose();
    nowPlayingTab.movieProvider.movieBloc.dispose();
    topRatedTab.movieProvider.movieBloc.dispose();
    popularTab.movieProvider.movieBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: getAppBar(
          tabController: _tabController,
          title: title,
          myTabs: [myTabs[0].tab, myTabs[1].tab, myTabs[2].tab],
          context: context),
      body: tabBarView,
    );
  }
}
