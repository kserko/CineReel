import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc_movies/bloc_providers/search_provider.dart';
import 'package:flutter_bloc_movies/ui/common_widgets/empty_result_widget.dart';
import 'package:flutter_bloc_movies/ui/common_widgets/movies_error_widget.dart';
import 'package:flutter_bloc_movies/ui/common_widgets/movies_loading_widget.dart';
import 'package:flutter_bloc_movies/ui/search_screen/search_intro_widget.dart';
import 'package:flutter_bloc_movies/ui/search_screen/search_result_widget.dart';
import 'package:flutter_bloc_movies/ui/search_screen/search_state.dart';

class SearchScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
  	final searchBloc = SearchProvider.of(context);
    return StreamBuilder(
        stream: searchBloc.state,
        initialData: SearchNoTerm(),
        builder: (BuildContext context, AsyncSnapshot<SearchState> snapshot) {
          final state = snapshot.data;
          return Scaffold(
            body: Stack(
              children: <Widget>[
                Flex(direction: Axis.vertical, children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 4.0),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'search TMDB...',
                      ),
                      style: TextStyle(
                        fontSize: 26.0,
                        fontFamily: "Hind",
                        decoration: TextDecoration.none,
                      ),
                      onChanged: searchBloc.onTextChanged.add,
                    ),
                  ),
                  Expanded(
                    child: Stack(
                      children: <Widget>[
                        // Fade in an intro screen if no term has been entered
                        SearchIntro(visible: state is SearchNoTerm),

                        // Fade in an Empty Result screen if the search contained
                        // no items
                        EmptyWidget(visible: state is SearchEmpty),

                        // Fade in a loading screen when results are being fetched
                        // from Github
                        MoviesLoadingWidget(visible: state is SearchLoading),

                        // Fade in an error if something went wrong when fetching
                        // the results
                        MoviesErrorWidget(visible: state is SearchError),

                        // Fade in the Result if available
                        SearchResultWidget(
                          movies: state is SearchPopulated ? state.movies : [],
                        ),
                      ],
                    ),
                  )
                ])
              ],
            ),
          );
        });
  }
}
