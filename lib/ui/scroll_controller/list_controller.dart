import 'package:flutter/widgets.dart';

class ListController extends ScrollController {

	bool _pause;

	bool get isPaused => _pause == true;

	pause() => _pause = true;
	unPause() => _pause = false;

	ListController() : super(initialScrollOffset: 0.0);
}
