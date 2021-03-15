import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider extends ChangeNotifier {
  late bool _isEnglish;
  late String _lang;
  SharedPreferences? _pref;

  LanguageProvider() {
    this._isEnglish = true;
    this._lang = 'eng';
    loadPref();
  }

  bool get isEnglish => this._isEnglish;

  String get lang => this._lang;

  initLang(bool val) {
    this._lang = val ? 'eng' : 'id';
  }

  set isEnglish(bool val) {
    this._isEnglish = val;
    initLang(val);
    savePref();
    notifyListeners();
  }

  initPref() async {
    if (_pref == null) {
      _pref = await SharedPreferences.getInstance();
    }
  }

  loadPref() async {
    await initPref();
    _isEnglish = _pref?.getBool('isEnglish') ?? true;
    _lang = _pref?.getString('language') ?? 'eng';
    notifyListeners();
  }

  savePref() async {
    await initPref();
    _pref?.setBool('isEnglish', this._isEnglish);
    _pref?.setString('language', this._lang);
  }
}

final changeLanguageProvider = ChangeNotifierProvider<LanguageProvider>((ref) {
  return LanguageProvider();
});
