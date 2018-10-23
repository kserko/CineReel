import 'package:cine_reel/bloc/bloc_provider.dart';
import 'package:cine_reel/bloc/genres_bloc.dart';
import 'package:cine_reel/ui/common_widgets/empty_result_widget.dart';
import 'package:cine_reel/ui/genres/genres_state.dart';
import 'package:cine_reel/ui/genres/genres_widget.dart';
import 'package:flutter/widgets.dart';

class GenresScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final genresBloc = BlocProvider.of<GenresBloc>(context);
    return StreamBuilder(
      key: Key('streamBuilder'),
      stream: genresBloc.stream,
      builder: (context, snapshot) {
        final data = snapshot.data;
        return Column(
          children: <Widget>[
            Expanded(
              child: Stack(
                key: Key('content'),
                children: <Widget>[
                  EmptyWidget(visible: data is GenresEmpty),
                  GenresWidget(
                    visible: data is GenresPopulated,
                    genres: data is GenresPopulated ? data.genres : [],
                  )
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
