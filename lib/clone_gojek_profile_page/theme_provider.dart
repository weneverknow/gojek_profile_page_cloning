import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  late bool _darkTheme;
  SharedPreferences? _prefs;
  String _key = 'theme';

  ThemeProvider() {
    _darkTheme = false;
    loadPrefs();
  }

  bool get darkTheme => this._darkTheme;

  changeTheme() {
    this._darkTheme = !_darkTheme;
    savePrefs();
    notifyListeners();
  }

  initPrefs() async {
    if (_prefs == null) {
      _prefs = await SharedPreferences.getInstance();
    }
  }

  loadPrefs() async {
    await initPrefs();
    _darkTheme = _prefs!.getBool(_key) ?? false;
    notifyListeners();
  }

  savePrefs() async {
    await initPrefs();
    _prefs!.setBool(_key, _darkTheme);
  }
}

final changeThemeNotifier = ChangeNotifierProvider<ThemeProvider>((ref) {
  return ThemeProvider();
});
