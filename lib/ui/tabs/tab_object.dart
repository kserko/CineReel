import 'package:cine_reel/bloc/bloc_provider.dart';
import 'package:flutter/material.dart';

enum TabKey { kNowPlaying, kUpcoming, kTopRated, kPopular, kGenres }

const Map<TabKey, String> tabs = {
	TabKey.kNowPlaying: "IN THEATERS",
	TabKey.kUpcoming: "UPCOMING",
	TabKey.kTopRated: "TOP RATED",
	TabKey.kPopular: "POPULAR",
	TabKey.kGenres: "GENRES"
};

class TabObject {
	Tab tab;
	BlocProvider provider;

	TabObject(TabKey tabKey, BlocProvider blocProvider) {
		tab = Tab(text: tabs[tabKey]);
		provider = blocProvider;
	}
}