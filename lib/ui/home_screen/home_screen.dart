import 'package:cine_reel/api/tmdb_api.dart';
import 'package:cine_reel/bloc/genres_bloc.dart';
import 'package:cine_reel/bloc/list_of_movies_blocs/now_playing_bloc.dart';
import 'package:cine_reel/bloc/list_of_movies_blocs/popular_bloc.dart';
import 'package:cine_reel/bloc/list_of_movies_blocs/top_rated_bloc.dart';
import 'package:cine_reel/bloc_providers/genres_provider.dart';
import 'package:cine_reel/bloc_providers/movie_provider.dart';
import 'package:cine_reel/ui/common_widgets/common_widgets.dart';
import 'package:cine_reel/ui/genres/genres_screen.dart';
import 'package:cine_reel/ui/list_screen/movies_list_screen.dart';
import 'package:cine_reel/utils/tab_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TabObject {
  Tab tab;
  dynamic provider;

  TabObject({
    @required this.tab,
    this.provider,
  });
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

  final genresTab = TabObject(
      tab: Tab(text: tab[TabKey.kGenres]),
      provider: GenresProvider(
        child: GenresScreen(),
        genreBloc: GenresBloc(tmdbApi: TMDBApi(), fetchOnInit: true),
      ));

  final nowPlayingTab = TabObject(
      tab: Tab(text: tab[TabKey.kNowPlaying]),
      provider: MovieProvider(
          child: MoviesListScreen(tabKey: TabKey.kNowPlaying),
          movieBloc: NowPlayingBloc(TMDBApi())));

  final topRatedTab = TabObject(
      tab: Tab(text: tab[TabKey.kTopRated]),
      provider: MovieProvider(
          child: MoviesListScreen(tabKey: TabKey.kTopRated), movieBloc: TopRatedBloc(TMDBApi())));

  final popularTab = TabObject(
      tab: Tab(text: tab[TabKey.kPopular]),
      provider: MovieProvider(
          child: MoviesListScreen(tabKey: TabKey.kPopular), movieBloc: PopularBloc(TMDBApi())));

  _MyTabbedPageState(this.title);

  @override
  void initState() {
    super.initState();
    myTabs = <TabObject>[nowPlayingTab, popularTab, topRatedTab, genresTab];
    _tabController = new TabController(vsync: this, length: myTabs.length);
    _tabController.addListener(_handleTabSelection);
    tabBarView = TabBarView(
        controller: _tabController,
        children: [myTabs[0].provider, myTabs[1].provider, myTabs[2].provider, myTabs[3].provider]);
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
    print('dispose home screen');
    _tabController.dispose();
    (nowPlayingTab.provider as MovieProvider).movieBloc.dispose();
    (topRatedTab.provider as MovieProvider).movieBloc.dispose();
    (popularTab.provider as MovieProvider).movieBloc.dispose();
    (genresTab.provider as GenresProvider).genresBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: getAppBar(
          tabController: _tabController,
          title: title,
          myTabs: [myTabs[0].tab, myTabs[1].tab, myTabs[2].tab, myTabs[3].tab],
          context: context),
      body: tabBarView,
    );
  }
}
