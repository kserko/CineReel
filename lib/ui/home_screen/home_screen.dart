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

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({Key key, this.title}) : super(key: key);

  @override
  _MyTabbedPageState createState() => new _MyTabbedPageState(title);
}

// ignore: mixin_inherits_from_not_object
class _MyTabbedPageState extends State<HomePage> with SingleTickerProviderStateMixin {
  final List<Tab> myTabs = <Tab>[
    new Tab(text: tab[TabKey.kNowPlaying]),
    new Tab(text: tab[TabKey.kTopRated]),
    new Tab(text: tab[TabKey.kPopular]),
  ];

  TabController _tabController;
  TabBarView tabBarView;
  int activeTab = 0;
  final String title;

  MovieProvider nowPlayingTab = MovieProvider(
      child: MoviesListScreen(tabKey: TabKey.kNowPlaying), movieBloc: NowPlayingBloc(TMDBApi()));

  MovieProvider topRatedTab = MovieProvider(
      child: MoviesListScreen(tabKey: TabKey.kTopRated), movieBloc: TopRatedBloc(TMDBApi()));

  MovieProvider popularTab = MovieProvider(
      child: MoviesListScreen(tabKey: TabKey.kPopular), movieBloc: PopularBloc(TMDBApi()));

  _MyTabbedPageState(this.title);

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: myTabs.length);
    _tabController.addListener(_handleTabSelection);
    tabBarView = TabBarView(controller: _tabController, children: [
    	nowPlayingTab,
			popularTab,
			topRatedTab,
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
    nowPlayingTab.movieBloc.dispose();
    topRatedTab.movieBloc.dispose();
    popularTab.movieBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: getAppBar(
          tabController: _tabController,
          title: title,
          myTabs: myTabs,
          context: context),
      body: tabBarView,
    );
  }
}
