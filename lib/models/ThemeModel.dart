import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class ThemeModel with ChangeNotifier {
  late ThemeData theme;

  ThemeModel({required ThemeData theme}) {
    backgroundColor = theme.backgroundColor;

    if (theme.brightness == Brightness.dark) {
      secondBackgroundColor = const Color(0xFF4E5D6A);
      textColor = Colors.white;
      secondaryFontColor = const Color(0xFF777777);
      disabledButtonBackground = const Color(0xFFc2c2c2);
      disabledButtonFont = const Color(0xFF777777);
      secondTextColor = const Color(0xFFA6BCD0);
      thirdTextColor = Colors.blue;
      iconColor = Colors.white;
      textColor2 = Colors.black;
    } else {
      secondaryFontColor = const Color(0xFF777777);
      secondBackgroundColor = Colors.white;
      disabledButtonBackground = const Color(0xFFc2c2c2);
      disabledButtonFont = const Color(0xFF777777);
      textColor = Colors.black;
      secondTextColor = const Color(0xFF696969);
      thirdTextColor = Colors.blue;
      iconColor = Colors.black;
      textColor2 = Colors.black;
    }

    // ignore: prefer_initializing_formals
    this.theme = theme;
  }

  ///Save theme name in local storage with shared prefs
  // Future<void> setToStorage(bool isDark) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setBool('isDark', isDark);
  // }

  Color secondBackgroundColor = Colors.white;
  Color backgroundColor = Colors.white;
  Color textColor = Colors.black;
  Color textColor2 = Colors.black;

  Color textColorwhite = Colors.white;
  Color iconColor = Colors.black;

  Color secondTextColor = const Color(0xFFFFFFFF);
  Color secondTextColor2 = const Color(0xFFFFFFFF);
  Color thirdTextColor = Colors.blue;

  Color lightBlue = Color(0xFF90CAF9);

  final Color shadowColor = Colors.black.withOpacity(0.07);
  final Color priceColor = const Color(0xFFFFA700);
  // final Color accentColor = const Color(0xFF6CC8EC);

  final Color appBlue = const Color(0xFF0063E8);
  final Color appOrange = const Color(0xFFFF6F00);
  Color primaryFontColor = const Color(0xFF2B2B2B);
  Color secondaryFontColor = const Color(0xFF777777);
  Color disabledButtonBackground = const Color(0xFFc2c2c2);
  Color disabledButtonFont = const Color(0xFF777777);
  final Color appGreen = const Color(0xFF0ECD00);

  ///Update theme to dark or light
  Future<void> updateTheme() async {
    bool isDark = theme.brightness == Brightness.dark;
    if (isDark) {
      theme = light;
    } else {
      theme = dark;
    }

    backgroundColor = theme.backgroundColor;

    if (theme.brightness == Brightness.dark) {
      secondBackgroundColor = const Color(0xFF4E5D6A);
      secondaryFontColor = const Color(0xFF777777);
      disabledButtonBackground = const Color(0xFFc2c2c2);
      disabledButtonFont = const Color(0xFF777777);
      textColor = Colors.white;
      secondTextColor = const Color(0xFFA6BCD0);
      thirdTextColor = Colors.blue;
      iconColor = Colors.white;
      textColor2 = Colors.black;
    } else {
      secondaryFontColor = const Color(0xFF777777);
      disabledButtonBackground = const Color(0xFFc2c2c2);
      disabledButtonFont = const Color(0xFF777777);
      secondBackgroundColor = Colors.white;
      textColor = Colors.black;
      secondTextColor = const Color(0xFF696969);
      thirdTextColor = Colors.blue;
      iconColor = Colors.black;
      textColor2 = Colors.black;
    }

    // await setToStorage(!isDark);
    notifyListeners();
  }

  static MaterialColor _primarySwatch(int color) {
    return MaterialColor(color, const {
      50: Color.fromRGBO(255, 92, 87, .1),
      100: Color.fromRGBO(255, 92, 87, .2),
      200: Color.fromRGBO(255, 92, 87, .3),
      300: Color.fromRGBO(255, 92, 87, .4),
      400: Color.fromRGBO(255, 92, 87, .5),
      500: Color.fromRGBO(255, 92, 87, .6),
      600: Color.fromRGBO(255, 92, 87, .7),
      700: Color.fromRGBO(255, 92, 87, .8),
      800: Color.fromRGBO(255, 92, 87, .9),
      900: Color.fromRGBO(255, 92, 87, 1),
    });
  }

  static MaterialColor lightSwatch = _primarySwatch(0xFF7BED8D);

  ///Light theme
  static final light = ThemeData(
      brightness: Brightness.light,
      primarySwatch: lightSwatch,
      primaryColor: lightSwatch,
      primaryColorDark: lightSwatch,
      accentColor: const Color(0xFF7BED8D),
      toggleableActiveColor: const Color(0xFF7BED8D),
      backgroundColor: const Color(0xFFf4f4f4),
      scaffoldBackgroundColor: const Color(0xffffffff),
      bottomSheetTheme:
          const BottomSheetThemeData(backgroundColor: Colors.transparent),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color(0xFFf4f4f4)),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: Color(0xFF7BED8D),
      ));

  ///Dark theme
  static final dark = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: lightSwatch,
    primaryColor: lightSwatch,
    primaryColorDark: lightSwatch,
    accentColor: const Color(0xFF7BED8D),
    toggleableActiveColor: const Color(0xFF7BED8D),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Color(0xFF7BED8D),
    ),
    backgroundColor: const Color(0xFF404E5A),
    scaffoldBackgroundColor: const Color(0xFF404E5A),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.transparent,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color(0xFF404E5A), elevation: 0),
  );
}
