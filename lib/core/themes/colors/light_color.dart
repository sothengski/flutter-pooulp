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
    primaryColor = ColorManager.primary; //appBar text Color
    appBarColor = ColorManager.primary; //appBar BgColor
    accentColor = ColorManager.grey800;
    scaffoldBackgroundColor = ColorManager.grey100; //bgBody
    tabBarColor = ColorManager.yellowAccent;
    tabbarNormalColor = ColorManager.green900;
    tabbarSelectedColor = ColorManager.red200;
    colorScheme = const ColorScheme.light().copyWith(
      onPrimary: ColorManager.white,
      onSecondary: ColorManager
          .primary25, //Icon Color inside floatingButton and Bg on Card Widget
      onSurface: ColorManager.grey300, //border around the OutlinedButton
    );
    brightness = Brightness.light;
    buttonTextColor = ColorManager.white;
    iconColor = ColorManager.white; //iconColor on drawer and action icons
    enabledColor = ColorManager.grey100;
    errorColor = ColorManager.red;
    fillColor = ColorManager.primary25;
    focusColor = ColorManager.primary50;
    disabledColor = ColorManager.grey100;
    highlightColor = ColorManager.grey600;
    hoverColor = ColorManager.grey300;
    focusErrorColor = ColorManager.red;

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
