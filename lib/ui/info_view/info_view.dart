import 'package:cine_reel/Constants.dart';
import 'package:cine_reel/ui/common_widgets/common_widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoView extends StatelessWidget {
  final TextStyle defaultStyle = TextStyle(fontSize: 16.0);

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
						buildAppTitle(),
						buildAppUrl(),
						buildHorizontalDivider(height: 60.0),
						buildTmdbLogo(),
						buildTmdbAttributionText(),
						buildHorizontalDivider(height: 60.0)
          ],
        )),
        style: defaultStyle,
        textAlign: TextAlign.center);
  }

  Widget buildTmdbAttributionText() {
    var attributionWidget = Text("This product uses the TMDb API but is not endorsed or "
        "certified by TMDb");

    return Container(padding: const EdgeInsets.only(top: 20.0), child: attributionWidget);
  }

  Container buildTmdbLogo() {
    return Container(
        width: 80.0,
        height: 80.0,
        margin: const EdgeInsets.only(right: 10.0),
        child: Image(image: AssetImage("assets/tmdb_icon.png")));
  }

  Widget buildAppUrl() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RichText(
          textAlign: TextAlign.center,
          overflow: TextOverflow.clip,
          text: TextSpan(style: defaultStyle.copyWith(fontSize: 16.0), children: [
            TextSpan(text: "This app is free as in freedom and you can check out the source code "
								"on gitlab \n"),
            TextSpan(
						style: defaultStyle.copyWith(color: Colors.blue, fontSize: 14.0),
                text: "https://gitlab.com/serk01/flutter-movies-bloc",
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    _launchURL("https://gitlab.com/serk01/flutter-movies-bloc");
                  })
          ])),
    );
  }

  Padding buildAppTitle() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text("$APP_NAME v1.0", style: defaultStyle.copyWith(fontSize: 22.0),),
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
