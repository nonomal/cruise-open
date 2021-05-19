import 'package:cruise/src/common/theme.dart';
import 'package:cruise/src/common/utils/common_utils.dart';
import 'package:cruise/src/common/view_manager.dart';
import 'package:cruise/src/widgets/cruise_app.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  CommonUtils.initialApp();
  SharedPreferences pref = await SharedPreferences.getInstance();
  String? themeName = pref.getString('theme');
  final theme = ThemeManager.fromThemeName(themeName);
  String? viewName = pref.getString('view');
  final view = ViewManager.fromViewName(viewName);
  runApp(
    CruiseApp(
      theme: theme,
      view: view,
    ),
  );
}
