import 'package:cine_reel/constants/api_constants.dart';
import 'package:cine_reel/ui/common_widgets/common_widgets.dart';
import 'package:cine_reel/utils/helper_functions.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:package_info/package_info.dart';

class InfoView extends StatefulWidget {

	@override
  InfoViewState createState() {
    return new InfoViewState();
  }
}

class InfoViewState extends State<InfoView> {
	PackageInfo _packageInfo = new PackageInfo(
		appName: 'Unknown',
		packageName: 'Unknown',
		version: 'Unknown',
		buildNumber: 'Unknown',
	);

  final TextStyle defaultStyle = TextStyle(fontSize: 16.0);

	@override
	void initState() {
		super.initState();
		_initPackageInfo();
	}

	Future<Null> _initPackageInfo() async {
		final PackageInfo info = await PackageInfo.fromPlatform();
		setState(() {
			_packageInfo = info;
		});
	}

	@override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
              child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              buildAppTitle(),
              buildAppUrl(),
              buildHorizontalDivider(height: 0.0),
              buildTmdbAttribution(),
              buildLauncherIconAttribution()
            ],
          )),
        ),
        style: defaultStyle,
        textAlign: TextAlign.center);
  }

  Widget buildTmdbAttribution() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(flex: 1, child: buildTmdbLogo()),
        Expanded(
            flex: 4,
            child: Text("This product uses the TMDb API but is not endorsed or "
                "certified by TMDb")),
      ],
    );
  }

  Widget buildTmdbLogo() {
    return SizedBox.fromSize(
      size: Size.fromHeight(40.0),
      child: Image(image: AssetImage("assets/tmdb_icon.png")),
    );
  }

  Widget buildAppUrl() {
    return RichText(
        textAlign: TextAlign.center,
        overflow: TextOverflow.clip,
        text: TextSpan(style: defaultStyle.copyWith(fontSize: 16.0), children: [
          TextSpan(
              text: "This app is free as in freedom and you can check out the source code "
                  "on github \n"),
          TextSpan(
              style: defaultStyle.copyWith(color: Colors.blue, fontSize: 14.0),
              text: "https://github.com/kserko/CineReel",
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  launchURL("https://github.com/kserko/CineReel");
                })
        ]));
  }

  Widget buildAppTitle() {

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: 40.0, width: 40.0, child: Image.asset("assets/film_reel.png")),
        Text(
          "$APP_NAME ${_packageInfo.version}",
          style: defaultStyle.copyWith(fontSize: 22.0),
        ),
      ],
    );
  }

  Widget buildLauncherIconAttribution() {
    var attributionWidget = RichText(
        textAlign: TextAlign.center,
        text: TextSpan(children: [
          TextSpan(text: 'Launcher icon made by', children: [
            TextSpan(
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    launchURL("http://www.freepik.com");
                  },
                text: ' by Freepik',
                style: defaultStyle.copyWith(color: Colors.blue)),
            TextSpan(text: ' from '),
            TextSpan(
                text: 'Flaticon',
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    launchURL("https://www.flaticon.com");
                  },
                style: defaultStyle.copyWith(color: Colors.blue)),
            TextSpan(text: ' is licensed by'),
            TextSpan(
                text: ' CC 3.0 BY',
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    launchURL("http://creativecommons.org/licenses/by/3.0/");
                  },
                style: defaultStyle.copyWith(color: Colors.blue))
          ])
        ]));

    return attributionWidget;
  }
}
