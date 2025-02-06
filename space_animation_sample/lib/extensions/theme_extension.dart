
import 'package:space_animation_sample/ui/themes/theme_type.dart';

extension ThemeExtension on ThemeType {
  String get toText {
    return this == ThemeType.light ? "light" : "dark";
  }
}

extension StringExtension on String {
  ThemeType get toThemeType {
    return this == "dark" ? ThemeType.dark : ThemeType.light;
  }
}
