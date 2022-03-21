part of 'color_theme.dart';

class LightColors implements IColors {
  @override
  ColorScheme? colorScheme;
  @override
  Color? appBarColor;

  @override
  Color? scaffoldBackgroundColor;

  @override
  Color? tabBarColor;

  @override
  Color? tabbarNormalColor;

  @override
  Color? tabbarSelectedColor;

  @override
  Brightness? brightness;

  @override
  Color? accentColor;

  @override
  Color? cardColor;

  @override
  Color? hintColor;

  @override
  Color? iconColor;

  @override
  Color? buttonTextColor;

  @override
  Color? primaryColor;

  @override
  Color? enabledColor;

  @override
  Color? errorColor;

  @override
  Color? fillColor;

  @override
  Color? focusColor;

  @override
  Color? focusErrorColor;

  @override
  Color? disabledColor;

  @override
  Color? highlightColor;

  @override
  Color? hoverColor;

  @override
  ButtonThemeData? buttonTheme;

  LightColors() {
    primaryColor = ColorsManager.primary; //appBar text Color
    appBarColor = ColorsManager.primary; //appBar BgColor
    accentColor = ColorsManager.grey800;
    scaffoldBackgroundColor =
        ColorsManager.white; //ColorsManager.grey100; //bgBody
    tabBarColor = ColorsManager.yellowAccent;
    tabbarNormalColor = ColorsManager.green900;
    tabbarSelectedColor = ColorsManager.red200;
    colorScheme = const ColorScheme.light().copyWith(
      primary: ColorsManager.primaryBlue, //for icon in inputtext when on focus
      onPrimary: ColorsManager.white,
      onSecondary: ColorsManager
          .primary25, //Icon Color inside floatingButton and Bg on Card Widget
      onSurface: ColorsManager.grey300, //border around the OutlinedButton
    );
    brightness = Brightness.light;
    buttonTextColor = ColorsManager.white;
    iconColor = ColorsManager.white; //iconColor on drawer and action icons
    enabledColor = ColorsManager.grey400;
    errorColor = ColorsManager.red;
    fillColor = ColorsManager.primary25;
    focusColor = ColorsManager.primary50;
    disabledColor = ColorsManager.grey100;
    highlightColor = ColorsManager.grey600;
    hoverColor = ColorsManager.grey300;
    focusErrorColor = ColorsManager.red;
    // textTheme: _lightTextTheme,
    //     visualDensity: VisualDensity.adaptivePlatformDensity,
    //     accentColor: theme.colors.colors.yellowPrimary,
    //     hintColor: theme.colors.colors.darkBluePrimary,
    //     fontFamily: theme.textTheme.fontFamily,
    //     textTheme: theme.textTheme.data,
    //     cardColor: theme.colors.colorScheme?.onSecondary,
    //     bottomAppBarColor: theme.colors.scaffoldBackground,
    //     tabBarTheme: TabBarTheme(
    //       indicator: const BoxDecoration(),
    //       labelColor: theme.colors.tabbarSelected,
    //       unselectedLabelColor: theme.colors.tabbarNormal,
    //     ),
    //     // floatingActionButtonTheme: FloatingActionButtonThemeData(
    //     //     foregroundColor: theme.colors.colors.white,
    //     //     backgroundColor: theme.colors.colors.mediumGreyBold),
    //     appBarTheme: AppBarTheme(
    //       backgroundColor: theme.colors.appBar,
    //     ),
    //     scaffoldBackgroundColor: theme.colors.scaffoldBackground,
    //     colorScheme: theme.colors.colorScheme,
  }
}
