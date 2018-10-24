import 'package:cine_reel/bloc/bloc_provider.dart';
import 'package:cine_reel/bloc/person_bloc.dart';
import 'package:cine_reel/models/tmdb_movie_details.dart';
import 'package:cine_reel/ui/person_details/person_state.dart';
import 'package:cine_reel/ui/person_details/person_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PersonScreen extends StatefulWidget {
  final Cast cast;

  PersonScreen(this.cast);

  @override
  PersonScreenState createState() {
    return new PersonScreenState();
  }
}

class PersonScreenState extends State<PersonScreen> {
  PersonBloc personBloc;

  @override
  Widget build(BuildContext context) {
    personBloc = BlocProvider.of<PersonBloc>(context);
    return Scaffold(
      body: StreamBuilder(
        stream: personBloc.stream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          var data = snapshot.data;
          print(data);
          return Column(children: <Widget>[
            Expanded(
              child: Stack(
                key: Key('content'),
                children: <Widget>[
                  PersonWidget(
                      cast: this.widget.cast,
                      errorMessage: data is PersonFailed ? data.error : "",
                      showLoading: data is PersonLoading,
                      person: data is PersonPopulated ? data.tmdbPerson : null)
                ],
              ),
            ),
          ]);
        },
      ),
    );
  }

  @override
  void dispose() {
    personBloc.dispose();
    super.dispose();
  }
}
