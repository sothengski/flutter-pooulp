import 'package:get/get.dart';
import 'package:pooulp_flutter/modules/modules.dart';

import 'routes.dart';

class AppPages {
  AppPages._(); //this is to prevent anyone from instantiating this object
  static String splashRoute = Routes.splashRoute;

  static final unknownRoute = GetPage(
    name: Routes.notFoundRoute,
    page: () => const NotfoundPage(),
  );

  static final List<GetPage> routes = [
    // GetPage(
    //   name: Routes.splashRoute,
    //   page: () => const SplashPage(),
    //   binding: SplashBinding(),
    // ),
    GetPage(
      name: Routes.homeRoute,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    // GetPage(
    //   name: Routes.onBoardingRoute,
    //   page: () => const OnBoardingPage(),
    //   binding: OnboardingBinding(),
    // ),
    // GetPage(
    //   name: Routes.signUpRoute,
    //   page: () => const SignUpPage(),
    //   binding: SignUpBinding(),
    // ),
    // GetPage(
    //   name: Routes.signInRoute,
    //   page: () => const SignInPage(),
    //   binding: SignInBinding(),
    // ),
  ];
}
