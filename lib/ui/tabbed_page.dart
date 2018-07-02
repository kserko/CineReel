import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc_movies/bloc/movie_bloc.dart';
import 'package:flutter_bloc_movies/bloc/movie_provider.dart';
import 'package:flutter_bloc_movies/common_widgets/CommonWidgets.dart';
import 'package:flutter_bloc_movies/state/MovieListState.dart';
import 'package:flutter_bloc_movies/ui/movie_row.dart';
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
  ];

  TabController _tabController;
  ScrollController _scrollController = new ScrollController(
		initialScrollOffset: 0.0
	);

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
        Column(children: [Flexible(child: buildMovieList(TabKey.kNowPlaying))]),
        Column(children: [Flexible(child: buildMovieList(TabKey.kTopRated))]),
      ]),
    );
  }

  StreamBuilder<MovieListState> buildMovieList(TabKey tabKey) {
    final movieBloc = MovieProvider.of(context);

    return StreamBuilder(
        stream: movieBloc.getStreamForTab(tabKey),
        initialData: movieBloc.getInitialData(tabKey),
        builder: (context, snapshot) {
					if (snapshot.data.isLoading) {
						return buildLoadingWidget();
					}
          else if (snapshot.data.hasErrors) {
            return buildErrorWidget(snapshot.data.errors[0]);
          }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                FlatButton.icon(
                    onPressed: () => onDownloadTap(movieBloc, tabKey),
                    icon: Icon(Icons.pages),
                    label: Text("Next page")),
                Expanded(child: buildListView(snapshot, movieBloc, tabKey)),
              ],
            );
        });
  }

  Widget buildListView(AsyncSnapshot<MovieListState> snapshot,
      MovieBloc movieBloc, TabKey tabKey) {
    return ListView.builder(
			controller: _scrollController,
        itemCount: snapshot.data.movies.length,
        itemBuilder: (context, index) {
        	//when approaching end of list, load next page
					if (index == snapshot.data.movies.length - 2) {
          	movieBloc.nextPage.add(tabKey);
					}
          return MovieRow(snapshot.data.movies[index], index);
        });
  }

  onDownloadTap(MovieBloc movieBloc, TabKey tabKey) {
    print('get next page');
    movieBloc.fetchNextPageForTab(tabKey);
  }
}

