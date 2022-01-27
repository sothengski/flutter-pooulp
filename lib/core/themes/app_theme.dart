import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../core.dart';

class AppThemeDark extends ITheme {
  @override
  late final ITextTheme textTheme;
  AppThemeDark() {
    textTheme = TextThemeDark(
      primaryColor: ColorsManager.white,
    );
  }
  @override
  IColors get colors => DarkColors();
}

class AppThemeLight extends ITheme {
  @override
  late final ITextTheme textTheme;

  AppThemeLight() {
    textTheme = TextThemeLight(
      primaryColor: colors.accentColor,
      displayColor: colors.primaryColor,
    );
  }

  @override
  IColors get colors => LightColors();
}

abstract class ITheme {
  IColors get colors;
  ITextTheme get textTheme;
}

mixin ThemeManager {
  static ThemeData createTheme(ITheme theme) => ThemeData(
        primaryColor: theme.colors.primaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        hintColor: theme.colors.hintColor,
        textTheme: theme.textTheme.data,
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: theme.colors.highlightColor,
          selectionColor: theme.colors.focusColor,
          selectionHandleColor: theme.colors.enabledColor,
        ),
        cardColor: theme.colors.colorScheme?.surface,
        bottomAppBarColor: theme.colors.iconColor,
        tabBarTheme: TabBarTheme(
          indicator: const BoxDecoration(),
          labelColor: theme.colors.tabbarSelectedColor,
          unselectedLabelColor: theme.colors.disabledColor,
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          foregroundColor: theme.colors.iconColor,
          backgroundColor: theme.colors.primaryColor,
        ),
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(
            color: theme.colors.iconColor,
          ),
          backgroundColor: theme.colors.appBarColor,
          systemOverlayStyle: SystemUiOverlayStyle.light, //statusBar Color
        ),
        scaffoldBackgroundColor: theme.colors.scaffoldBackgroundColor,
        colorScheme: theme.colors.colorScheme,
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: TextButton.styleFrom(
            primary: theme.colors.primaryColor,
            backgroundColor: theme.colors.buttonTextColor,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: TextButton.styleFrom(
            primary: theme.colors.buttonTextColor,
            backgroundColor: theme.colors.primaryColor,
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            primary: theme.colors.primaryColor,
          ),
        ),
        buttonTheme: ButtonThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          buttonColor: theme.colors.buttonTextColor,
          textTheme: ButtonTextTheme.primary,
          focusColor: theme.colors.focusColor,
          hoverColor: theme.colors.hoverColor,
          highlightColor: theme.colors.highlightColor,
          disabledColor: theme.colors.disabledColor,
          colorScheme: theme.colors.colorScheme,
        ),
        unselectedWidgetColor: theme.colors.buttonTextColor,
        inputDecorationTheme: InputDecorationTheme(
          prefixStyle: TextStyle(color: theme.colors.iconColor),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: theme.colors.enabledColor!,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: theme.colors.focusColor!,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: theme.colors.errorColor!,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: theme.colors.focusErrorColor!,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          ),
          fillColor: theme.colors.fillColor,
          focusColor: theme.colors.focusColor,
        ),
        iconTheme: IconThemeData(
          color: theme.colors.iconColor,
        ),
      );
}
