import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:space_animation_sample/ui/themes/theme_type.dart';
import 'custom_theme.dart';
export 'custom_theme.dart';

class AppTheme {
  static ThemeType themeType = ThemeType.light;
  static TextDirection textDirection = TextDirection.ltr;
  static ThemeData theme = getTheme();

  AppTheme._();

  static init() {
    resetFont();
    FxAppTheme.changeLightTheme(lightTheme);
    FxAppTheme.changeDarkTheme(darkTheme);
  }

  static resetFont() {
    FxTextStyle.changeFontFamily(GoogleFonts.ibmPlexSans);
    FxTextStyle.changeDefaultFontWeight({
      100: FontWeight.w100,
      200: FontWeight.w200,
      300: FontWeight.w300,
      400: FontWeight.w300,
      500: FontWeight.w400,
      600: FontWeight.w500,
      700: FontWeight.w600,
      800: FontWeight.w700,
      900: FontWeight.w800,
    });
  }

  static ThemeData getTheme([ThemeType? themeType]) {
    themeType = themeType ?? AppTheme.themeType;
    if (themeType == ThemeType.light) return lightTheme;
    return darkTheme;
  }

  /// -------------------------- Light Theme  -------------------------------------------- ///
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Color(0xff3C4EC5),
    scaffoldBackgroundColor: Color(0xffd9d6d6),
    canvasColor: Colors.transparent,
    appBarTheme: AppBarTheme(
        backgroundColor: Color(0xffffffff),
        iconTheme: IconThemeData(color: Color(0xff495057)),
        actionsIconTheme: IconThemeData(color: Color(0xff495057))),
    // cardTheme: CardTheme(color: Color(0xfff0f0f0)),
    cardColor: Color(0xfff0f0f0),
    textTheme: TextTheme(
        titleMedium: GoogleFonts.aBeeZee(), bodyMedium: GoogleFonts.abel()),
    colorScheme: ColorScheme.fromSeed(
        primary: Color(0xfffc007e),
        secondary: Color(0xff07efc6),
        seedColor: Color(0xfffc007e),
        surfaceDim: Color.fromRGBO(211, 211, 211, 0.999),
        brightness: Brightness.light),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Color(0xff3C4EC5),
        splashColor: Color(0xffeeeeee).withAlpha(100),
        highlightElevation: 8,
        elevation: 4,
        focusColor: Color(0xff3C4EC5),
        hoverColor: Color(0xff3C4EC5),
        foregroundColor: Color(0xffeeeeee)),
    dividerTheme: DividerThemeData(color: Color(0xffe8e8e8), thickness: 1),
    dividerColor: Color(0xffe8e8e8),
    bottomAppBarTheme: BottomAppBarTheme(color: Color(0xffeeeeee), elevation: 2),
    // tabBarTheme: TabBarTheme(
    //   unselectedLabelColor: Color(0xff495057),
    //   labelColor: Color(0xff3d63ff),
    //   indicatorSize: TabBarIndicatorSize.label,
    //   indicator: UnderlineTabIndicator(
    //     borderSide: BorderSide(color: Color(0xff3d63ff), width: 2.0),
    //   ),
    // ),
    checkboxTheme: CheckboxThemeData(
      checkColor: MaterialStateProperty.all(Color(0xffeeeeee)),
      fillColor: MaterialStateProperty.all(Color(0xff3C4EC5)),
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.all(Color(0xff3C4EC5)),
    ),
    switchTheme: SwitchThemeData(
      trackColor: MaterialStateProperty.resolveWith((state) {
        const Set<MaterialState> interactiveStates = <MaterialState>{
          MaterialState.pressed,
          MaterialState.hovered,
          MaterialState.focused,
          MaterialState.selected,
        };
        if (state.any(interactiveStates.contains)) {
          return Color(0xffabb3ea);
        }
        return null;
      }),
      thumbColor: MaterialStateProperty.resolveWith((state) {
        const Set<MaterialState> interactiveStates = <MaterialState>{
          MaterialState.pressed,
          MaterialState.hovered,
          MaterialState.focused,
          MaterialState.selected,
        };
        if (state.any(interactiveStates.contains)) {
          return Color(0xff3C4EC5);
        }
        return null;
      }),
    ),
    sliderTheme: SliderThemeData(
      activeTrackColor: Color(0xff3d63ff),
      inactiveTrackColor: Color(0xff3d63ff).withAlpha(140),
      trackShape: RoundedRectSliderTrackShape(),
      trackHeight: 4.0,
      thumbColor: Color(0xff3d63ff),
      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10.0),
      overlayShape: RoundSliderOverlayShape(overlayRadius: 24.0),
      tickMarkShape: RoundSliderTickMarkShape(),
      inactiveTickMarkColor: Colors.red[100],
      valueIndicatorShape: PaddleSliderValueIndicatorShape(),
      valueIndicatorTextStyle: TextStyle(
        color: Color(0xffeeeeee),
      ),
    ),
    splashColor: Colors.white.withAlpha(100),
    indicatorColor: Color(0xffeeeeee),
    highlightColor: Color(0xffeeeeee),
    unselectedWidgetColor: Color(0xfff0323c),
  );

  /// -------------------------- Dark Theme  -------------------------------------------- ///
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Color(0xff069DEF),
    scaffoldBackgroundColor: Color(0xff232121),
    canvasColor: Colors.transparent,
    appBarTheme: AppBarTheme(backgroundColor: Color(0xff161616)),
    // cardTheme: CardTheme(color: Color(0xff222327)),
    cardColor: Color(0xff222327),
    colorScheme: ColorScheme.fromSeed(
      seedColor: Color(0xff069DEF),
      brightness: Brightness.dark,
      surfaceDim: Color.fromRGBO(211, 211, 211, 0.999),
    ),
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        borderSide: BorderSide(width: 1, color: Color(0xff069DEF)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        borderSide: BorderSide(width: 1, color: Colors.white70),
      ),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(width: 1, color: Colors.white70)),
    ),
    dividerTheme: DividerThemeData(color: Color(0xff363636), thickness: 1),
    dividerColor: Color(0xff363636),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Color(0xff069DEF),
        splashColor: Colors.white.withAlpha(100),
        highlightElevation: 8,
        elevation: 4,
        focusColor: Color(0xff069DEF),
        hoverColor: Color(0xff069DEF),
        foregroundColor: Colors.white),
    bottomAppBarTheme: BottomAppBarTheme(color: Color(0xff464c52), elevation: 2),
    // tabBarTheme: TabBarTheme(
    //   unselectedLabelColor: Color(0xff495057),
    //   labelColor: Color(0xff069DEF),
    //   indicatorSize: TabBarIndicatorSize.label,
    //   indicator: UnderlineTabIndicator(
    //     borderSide: BorderSide(color: Color(0xff069DEF), width: 2.0),
    //   ),
    // ),
    switchTheme: SwitchThemeData(
      trackColor: MaterialStateProperty.resolveWith((state) {
        const Set<MaterialState> interactiveStates = <MaterialState>{
          MaterialState.pressed,
          MaterialState.hovered,
          MaterialState.focused,
          MaterialState.selected,
        };
        if (state.any(interactiveStates.contains)) {
          return Color(0xffabb3ea);
        }
        return null;
      }),
      thumbColor: MaterialStateProperty.resolveWith((state) {
        const Set<MaterialState> interactiveStates = <MaterialState>{
          MaterialState.pressed,
          MaterialState.hovered,
          MaterialState.focused,
          MaterialState.selected,
        };
        if (state.any(interactiveStates.contains)) {
          return Color(0xff3C4EC5);
        }
        return null;
      }),
    ),
    sliderTheme: SliderThemeData(
      activeTrackColor: Color(0xff069DEF),
      inactiveTrackColor: Color(0xff069DEF).withAlpha(100),
      trackShape: RoundedRectSliderTrackShape(),
      trackHeight: 4.0,
      thumbColor: Color(0xff069DEF),
      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10.0),
      overlayShape: RoundSliderOverlayShape(overlayRadius: 24.0),
      tickMarkShape: RoundSliderTickMarkShape(),
      inactiveTickMarkColor: Colors.red[100],
      valueIndicatorShape: PaddleSliderValueIndicatorShape(),
      valueIndicatorTextStyle: TextStyle(
        color: Colors.white,
      ),
    ),
    indicatorColor: Colors.white,
    disabledColor: Color(0xffa3a3a3),
    highlightColor: Colors.white.withAlpha(28),
    unselectedWidgetColor: Colors.orange,
    splashColor: Colors.white.withAlpha(56),
  );
}
