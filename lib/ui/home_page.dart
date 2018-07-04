import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc_movies/bloc/movie_provider.dart';
import 'package:flutter_bloc_movies/common_widgets/CommonWidgets.dart';
import 'package:flutter_bloc_movies/ui/stream_component.dart';
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
//    new Tab(text: tab[TabKey.kTopRated]),
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
        MovieProvider(child: StreamComponent()),
//        Column(children: [Flexible(child: buildStreamBuilder(TabKey.kTopRated, TabKey.kTopRated.index))]),
//        Column(children: [Flexible(child: buildStreamBuilder(TabKey.kPopular, TabKey.kPopular.index))])
      ]),
    );
  }
}