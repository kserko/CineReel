import 'package:cine_reel/bloc/bloc_provider.dart';
import 'package:cine_reel/bloc/search_bloc.dart';
import 'package:cine_reel/ui/common_widgets/empty_result_widget.dart';
import 'package:cine_reel/ui/common_widgets/errors_widget.dart';
import 'package:cine_reel/ui/common_widgets/loading_widget.dart';
import 'package:cine_reel/ui/search_screen/search_intro_widget.dart';
import 'package:cine_reel/ui/search_screen/search_result_widget.dart';
import 'package:cine_reel/ui/search_screen/search_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  SearchBloc searchBloc;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    searchBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    searchBloc = BlocProvider.of<SearchBloc>(context);
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
                        LoadingWidget(visible: state is SearchLoading),

                        // Fade in an error if something went wrong when fetching
                        // the results
                        ErrorsWidget(visible: state is SearchError),

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
