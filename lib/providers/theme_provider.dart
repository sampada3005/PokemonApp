import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends StateNotifier<bool> {
  ThemeProvider() : super(false);

  void toggleTheme() async {
    final SharedPreferencesAsync asyncPref = SharedPreferencesAsync();
    state = !state;
    await asyncPref.setBool('AppTheme', state);
  }

  Future getSavedTheme() async {
    final SharedPreferencesAsync asyncPref = SharedPreferencesAsync();
    final theme = await asyncPref.getBool('AppTheme');
    return theme ?? false;
  }
}

final themeProvider =
    StateNotifierProvider<ThemeProvider, bool>((ref) => ThemeProvider());
