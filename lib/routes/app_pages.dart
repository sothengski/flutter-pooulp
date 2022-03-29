import 'package:get/get.dart';

import '../modules/modules.dart';
import 'routes.dart';

class AppPages {
  AppPages._(); //this is to prevent anyone from instantiating this object
  static String splashRoute = Routes.splashRoute;

  static final GetPage<dynamic> unknownRoute = GetPage<dynamic>(
    name: Routes.unknownRoute,
    page: () => const UnknownRoutePage(),
  );

  static final List<GetPage> routes = [
    GetPage(
      name: Routes.splashRoute,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),
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
    GetPage(
      name: Routes.signUpRoute,
      page: () => const SignUpPage(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: Routes.signInRoute,
      page: () => const SignInPage(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: Routes.editUserInfoRoute,
      page: () => const EditUserInformationPage(),
      binding: EditUserInformationBinding(),
    ),
    GetPage(
      name: Routes.settingsRoute,
      page: () => const SettingPage(),
      binding: SettingBinding(),
    ),
    GetPage(
      name: Routes.offerdetailRoute,
      page: () => OfferDetailPage(),
      binding: OfferDetailBinding(),
    ),
    GetPage(
      name: Routes.addOrEditEducationRoute,
      page: () => AddOrEditEducationPage(),
      binding: EducationBinding(),
    ),
    GetPage(
      name: Routes.addOrEditExperienceRoute,
      page: () => const AddOrEditExperiencePage(),
      binding: ExperienceBinding(),
    ),
    GetPage(
      name: Routes.addOrEditAchievementRoute,
      page: () => const AddOrEditAchievementPage(),
      binding: AchievementBinding(),
    ),
    GetPage(
      name: Routes.addOrEditCertificateRoute,
      page: () => const AddOrEditCertificatePage(),
      binding: CertificateBinding(),
    ),
    GetPage(
      name: Routes.addOrEditLanguageUsageRoute,
      page: () => const AddOrEditLanguageUsagePage(),
      binding: LanguageUsageBinding(),
    ),
  ];
}
