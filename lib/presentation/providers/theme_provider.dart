import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

// Listado de colores inmutable
final colorListProvider = Provider( (ref) => colorList );

// Un simple boolean
final isDarkModeProvider = StateProvider<bool>( (ref) => false );

// Un simple entero
final selectedColorProvider = StateProvider<int>( (ref) => 0 );

// Un objeto de tipo AppTheme (custom)
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier()
);

// Controller o Notifier
class ThemeNotifier extends StateNotifier<AppTheme> {
  
  // STATE = Estado = new AppTheme()
  ThemeNotifier(): super( AppTheme() );

  void toggleDarkmode() {
    state = state.copyWith( isDarkMode: !state.isDarkMode );
  }

  void changeColorIndex( int colorIndex ) {
    state = state.copyWith( selectedColor: colorIndex );
  }

}