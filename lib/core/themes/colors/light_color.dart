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
    primaryColor = AppColors.primaryColor; //appBar text Color
    appBarColor = AppColors.primaryColor; //appBar BgColor
    accentColor = AppColors.grey800Color;
    scaffoldBackgroundColor = AppColors.grey100Color; //bgBody
    tabBarColor = AppColors.yellowAccentColor;
    tabbarNormalColor = AppColors.green900Color;
    tabbarSelectedColor = AppColors.red200Color;
    colorScheme = const ColorScheme.light().copyWith(
      onPrimary: AppColors.whiteColor,
      onSecondary: AppColors
          .primary25Color, //Icon Color inside floatingButton and Bg on Card Widget
      onSurface: AppColors.grey300Color, //border around the OutlinedButton
    );
    brightness = Brightness.light;
    buttonTextColor = AppColors.whiteColor;
    iconColor = AppColors.whiteColor; //iconColor on drawer and action icons
    enabledColor = AppColors.grey100Color;
    errorColor = AppColors.redColor;
    fillColor = AppColors.primary25Color;
    focusColor = AppColors.primary50Color;
    disabledColor = AppColors.grey100Color;
    highlightColor = AppColors.grey600Color;
    hoverColor = AppColors.grey300Color;
    focusErrorColor = AppColors.redColor;

    // textTheme: _lightTextTheme,
    //     visualDensity: VisualDensity.adaptivePlatformDensity,
    //     accentColor: theme.colors.colors.yellowPrimaryColor,
    //     hintColor: theme.colors.colors.darkBluePrimaryColor,
    //     fontFamily: theme.textTheme.fontFamily,
    //     textTheme: theme.textTheme.data,
    //     cardColor: theme.colors.colorScheme?.onSecondary,
    //     bottomAppBarColor: theme.colors.scaffoldBackgroundColor,
    //     tabBarTheme: TabBarTheme(
    //       indicator: const BoxDecoration(),
    //       labelColor: theme.colors.tabbarSelectedColor,
    //       unselectedLabelColor: theme.colors.tabbarNormalColor,
    //     ),
    //     // floatingActionButtonTheme: FloatingActionButtonThemeData(
    //     //     foregroundColor: theme.colors.colors.whiteColor,
    //     //     backgroundColor: theme.colors.colors.mediumGreyBold),
    //     appBarTheme: AppBarTheme(
    //       backgroundColor: theme.colors.appBarColor,
    //     ),
    //     scaffoldBackgroundColor: theme.colors.scaffoldBackgroundColor,
    //     colorScheme: theme.colors.colorScheme,
  }
}
