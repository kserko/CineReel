import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc_movies/bloc/movie_provider.dart';
import 'package:flutter_bloc_movies/common_widgets/CommonWidgets.dart';
import 'package:flutter_bloc_movies/state/search_state.dart';
import 'package:flutter_bloc_movies/ui/empty_result_widget.dart';
import 'package:flutter_bloc_movies/ui/movies_error_widget.dart';
import 'package:flutter_bloc_movies/ui/movies_loading_widget.dart';
import 'package:flutter_bloc_movies/ui/movies_result_widget.dart';
import 'package:flutter_bloc_movies/utils/TabConstants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _MyTabbedPageState createState() => new _MyTabbedPageState();
}

// ignore: mixin_inherits_from_not_object
class _MyTabbedPageState extends State<HomePage> with SingleTickerProviderStateMixin {
  final List<Tab> myTabs = <Tab>[
    new Tab(text: tab[TabKey.kNowPlaying]),
    new Tab(text: tab[TabKey.kTopRated]),
//    new Tab(text: tab[TabKey.kPopular]),
  ];

  TabController _tabController;
  int activeTab = 0;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: myTabs.length);
    _tabController.addListener(_handleTabSelection);
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
      appBar: buildAppBar(context, "flutter Bloc!", myTabs, _tabController),
      body: TabBarView(controller: _tabController, children: [
        Column(children: [
          Flexible(
              child: buildStreamBuilder(
                  TabKey.kNowPlaying, TabKey.kNowPlaying.index))
        ]),
        Column(children: [Flexible(child: buildStreamBuilder(TabKey.kTopRated, TabKey.kTopRated.index))]),
//        Column(children: [Flexible(child: buildStreamBuilder(TabKey.kPopular, TabKey.kPopular.index))])
      ]),
    );
  }

  StreamBuilder<MoviesState> buildStreamBuilder(TabKey tabKey, int tabIndex) {
    final movieBloc = MovieProvider.of(context);

//    var stream = movieBloc.getStreamForTab(tabKey);
//		var initialDataForStream = movieBloc.getInitialData(tabKey);
//		var state = movieBloc.getStateFor(tabKey);

    return StreamBuilder(
        stream: movieBloc.getStreamForTab(tabKey),
        initialData: movieBloc.fetchNextPageForTab(tabKey),
        builder: (context, snapshot) {
          final data = snapshot.data;
          return Flex(
						direction: Axis.vertical,
            children: [
              Expanded(
                child: Stack(
                  children: <Widget>[
                    // Fade in an Empty Result screen if the search contained
                    // no items
                    EmptyWidget(visible: data is MoviesEmpty),

                    // Fade in a loading screen when results are being fetched
                    // from Github
                    LoadingWidget(visible: data is MoviesLoading),

                    // Fade in an error if something went wrong when fetching
                    // the results
                    SearchErrorWidget(visible: data is MoviesError, error:
										data is MoviesError ? data.error : ""),

                    // Fade in the Result if available
                    SearchResultWidget(items: data is MoviesPopulated ? data.result : [],
                    ),
                  ],
                ),
              ),
            ],
          );
        });
  }
}
