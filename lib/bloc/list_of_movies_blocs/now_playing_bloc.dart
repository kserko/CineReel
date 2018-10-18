import 'package:cine_reel/api/tmdb_api.dart';
import 'package:cine_reel/bloc/movie_bloc.dart';
import 'package:cine_reel/utils/tab_constants.dart';

class NowPlayingBloc extends MovieBloc {
  NowPlayingBloc(TMDBApi api)
      : super(
          api: api,
          tabKey: TabKey.kNowPlaying,
        );
}
