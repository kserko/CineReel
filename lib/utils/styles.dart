import 'dart:ui';

import 'package:flutter/material.dart';

double FONT_LARGE = 26.0;
double FONT_MEDIUM = 18.0;

final STYLE_TITLE = TextStyle(
    fontSize: FONT_LARGE, color: Colors.white, fontWeight: FontWeight.bold);

final STYLE_SMALLER_TITLE = STYLE_TITLE.copyWith(fontSize: FONT_MEDIUM);

final STYLE_SUBTITLE = TextStyle(fontSize: FONT_MEDIUM, color: Colors.white);
