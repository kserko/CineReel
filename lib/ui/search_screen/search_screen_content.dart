import 'package:cine_reel/bloc/bloc_provider.dart';
import 'package:cine_reel/bloc/seach_movies_bloc.dart';
import 'package:cine_reel/bloc/search_people_bloc.dart';
import 'package:cine_reel/ui/common_widgets/empty_result_widget.dart';
import 'package:cine_reel/ui/common_widgets/errors_widget.dart';
import 'package:cine_reel/ui/common_widgets/loading_widget.dart';
import 'package:cine_reel/ui/search_screen/search_intro_widget.dart';
import 'package:cine_reel/ui/search_screen/search_result_widget.dart';
import 'package:cine_reel/ui/search_screen/search_state.dart';
import 'package:cine_reel/ui/tabs/tab_object.dart';
import 'package:flutter/widgets.dart';

class SearchContentScreen extends StatefulWidget {
	final TextEditingController textController;
	final TabKey tabKey;

	SearchContentScreen(this.textController, TabKey this.tabKey) {
	}

	@override
	SearchContentScreenState createState() {
		return new SearchContentScreenState();
	}
}

class SearchContentScreenState extends State<SearchContentScreen> with AutomaticKeepAliveClientMixin {
  SearchMoviesBloc searchMoviesBloc;
  SearchPeopleBloc searchPeopleBloc;
	BlocBase activeBloc;

  @override
  void initState() {
    super.initState();
    print("init tab ${widget.tabKey}");
    widget.textController.addListener(_textChanged);
  }

  @override
  Widget build(BuildContext context) {
		if (isMoviesTab()) {
			print("build search movies tab");
			searchMoviesBloc = BlocProvider.of<SearchMoviesBloc>(context);
		} else {
			print("build search people tab");
			searchPeopleBloc = BlocProvider.of<SearchPeopleBloc>(context);
		}

		return StreamBuilder(
        stream: isMoviesTab() ? searchMoviesBloc.state : searchPeopleBloc.state,
        builder: (BuildContext context, AsyncSnapshot<SearchState> snapshot) {
          final state = snapshot.data;
          return buildStack(state);
        });
  }

  bool isMoviesTab() => widget.tabKey == TabKey.kSearchMovies;

  Stack buildStack(SearchState state) {
    return Stack(
      children: <Widget>[
        Flex(direction: Axis.vertical, children: <Widget>[
          Expanded(
            child: Stack(
              children: <Widget>[
                // Fade in an intro screen if no term has been entered
                SearchIntro(
                  visible: state is SearchNoTerm,
                  isSearchingMovies: isMoviesTab(),
                ),

                // Fade in an Empty Result screen if the search contained
                // no items
                EmptyWidget(visible: state is SearchEmpty),

                // Fade in a loading screen when results are being fetched
                // from Github
                LoadingWidget(visible: state is SearchLoading),

                // Fade in an error if something went wrong when fetching
                // the results
                ErrorsWidget(visible: state is SearchError),

                // Fade in the Result if available
                SearchResultWidget(
                  movies: state is SearchPopulated ? state.movies : null,
                  people: state is SearchPopulated ? state.people : null,
                ),
              ],
            ),
          )
        ])
      ],
    );
  }

  void _textChanged() {
  	if (isMoviesTab()) {
			searchMoviesBloc.onTextChanged.add(widget.textController.text);
		} else {
			searchPeopleBloc.onTextChanged.add(widget.textController.text);
		}
	}

  @override
  bool get wantKeepAlive => true;
}
