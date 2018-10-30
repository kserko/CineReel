import 'package:cine_reel/bloc/bloc_provider.dart';
import 'package:flutter/material.dart';

enum TabKey { kNowPlaying, kTopRated, kPopular, kGenres }

const Map<TabKey, String> tabs = {
	TabKey.kNowPlaying: "Now Playing",
	TabKey.kTopRated: "Top Rated",
	TabKey.kPopular: "Popular",
	TabKey.kGenres: "Genres"
};

class TabObject {
	Tab tab;
	BlocProvider provider;

	TabObject(TabKey tabKey, BlocProvider blocProvider) {
		tab = Tab(text: tabs[tabKey]);
		provider = blocProvider;
	}
}