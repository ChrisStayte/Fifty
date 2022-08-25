import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Will add settings here for future use
class SettingsProvider extends ChangeNotifier {
  SharedPreferences? prefs;

  SettingsProvider() {}
}
