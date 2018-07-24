import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc_movies/api/tmdb_api.dart';
import 'package:flutter_bloc_movies/bloc/now_playing_bloc.dart';
import 'package:flutter_bloc_movies/bloc/popular_bloc.dart';
import 'package:flutter_bloc_movies/bloc/to_rated_bloc.dart';
import 'package:flutter_bloc_movies/bloc_providers/movie_provider.dart';
import 'package:flutter_bloc_movies/ui/common_widgets/common_widgets.dart';
import 'package:flutter_bloc_movies/ui/list_page/movie_list_stream_builder.dart';
import 'package:flutter_bloc_movies/utils/TabConstants.dart';

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
  int activeTab = 0;

  var title;

  _MyTabbedPageState(this.title);

  var tabBarView;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: myTabs.length);
    _tabController.addListener(_handleTabSelection);
    tabBarView = TabBarView(controller: _tabController, children: [
      MovieProvider(
          child: MovieListStreamBuilder(),
          movieBloc: NowPlayingBloc(TMDBApi())),
      MovieProvider(
          child: MovieListStreamBuilder(), movieBloc: TopRatedBloc(TMDBApi())),
      MovieProvider(
          child: MovieListStreamBuilder(), movieBloc: PopularBloc(TMDBApi()))
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: getAppBar(tabController: _tabController, title: title, myTabs:
			myTabs, context: context),
			body: tabBarView,
    );
  }
}
