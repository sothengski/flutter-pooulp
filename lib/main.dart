import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'core/core.dart';
import 'data/data.dart';
import 'modules/modules.dart';
import 'routes/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init(LocalStorage.credentialName);
  // final PendingDynamicLinkData? data =
  //     await FirebaseDynamicLinks.instance.getInitialLink();
  // if (data != null) {
  //   final Uri deepLink = data.link;
  //   // handleDynamicLink(url: deepLink);
  //   print('Deeplinks uri:${deepLink.path}');
  // }
  // await getAllTranslationLangsProvider(lang: 'en');
  // await getAllTranslationLangsProvider(lang: 'fr');
  await AppBasicServices().getLangsFromFile(lang: 'en');
  await AppBasicServices().getLangsFromFile(lang: 'fr');
  await AppBasicServices().getLangsFromFile(lang: 'nl');
  // await Firebase.initializeApp();
  // await FirebaseDynamicLinkService().initLinks();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    // DeviceOrientation.portraitDown,
  ]);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.light,
    // const SystemUiOverlayStyle(
    //   statusBarColor: Colors.transparent,
    //   systemNavigationBarColor: Colors.amber, // navigation bar color
    //   // systemNavigationBarColor: Colors.transparent,
    //   // statusBarColor: Colors.white, // status bar color
    //   statusBarIconBrightness: Brightness.dark, // status bar icon color
    //   systemNavigationBarIconBrightness:
    //       Brightness.dark, // color of navigation controls
    // ),
  );
  // await Firebase.initializeApp(options: DefaultFirebaseConfig.platformOptions);
  // const String link = 'https://dynamic-link-domain/ke2Qa';

  // final PendingDynamicLinkData? initialLink =
  //     await FirebaseDynamicLinks.instance.getDynamicLink(Uri.parse(link));

  // FirebaseDynamicLinks.instance.onLink.listen((dynamicLinkData) {
  //   // Navigator.pushNamed(context, dynamicLinkData.link.path);
  // }).onError((error) {
  //   // Handle errors
  // });
  // final dynamicLinkService = FirebaseDynamicLinkService();
  // await dynamicLinkService.initLinks();
  // await FirebaseDynamicLinks.instance.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  await initialConfig();
  final storage = Get.find<StorageServices>();

  runApp(MyApp(storageServices: storage));
}

class MyApp extends StatefulWidget {
  final StorageServices? storageServices;
  const MyApp({
    Key? key,
    this.storageServices,
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String url = "";

  @override
  void initState() {
    // initDynamicLinks();
    super.initState();
  }

  ///Retrieve dynamic Link firebase
  // Future<void> initDynamicLinks() async {
  //   // print('initDynamicLinks');

  //   final PendingDynamicLinkData? data =
  //       await FirebaseDynamicLinks.instance.getInitialLink();
  //   if (data != null) {
  //     final Uri deepLink = data.link;
  //     // handleDynamicLink(url: deepLink);
  //     print('Deeplinks uri:${deepLink.path}');
  //   }
  //   // FirebaseDynamicLinks.instance.onLink(
  //   //   onSuccess: (PendingDynamicLinkData? dynamicLink) async {
  //   //     final Uri? deepLink = dynamicLink?.link;
  //   //     if (deepLink != null) {
  //   //       print('Deeplinks uri:${deepLink.path}');
  //   //     }
  //   //   },
  //   //   onError: (OnLink e) async {
  //   //     print(e.message);
  //   //   },
  //   // );
  // }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // builder: (context, child) => GestureDetector(
      //   onTap: () {
      //     unFocusKeyBoard(context);
      //   },
      //   child: child,
      // ),
      initialBinding: NetworkBinding(),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(textScaler: const TextScaler.linear(1.0)),
          child: GestureDetector(
            onTap: () {
              unFocusKeyBoard(context);
            },
            child: child,
          ),
        );
      },
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splashRoute,
      getPages: AppPages.routes,
      unknownRoute: AppPages.unknownRoute,
      defaultTransition: Transition.fade,
      title: 'Pooulp Flutter',
      theme: ThemeManager.createTheme(
        AppThemeLight(),
      ),
      locale: LanguageController().getLocale,
      // locale: storageServices!.languageCode == 'nl'
      //     ? const Locale('nl', 'NL')
      //     : storageServices!.languageCode == 'fr'
      //         ? const Locale('fr', 'FR')
      //         : const Locale('en', 'US'),

      fallbackLocale: LocalizationService.fallbackLocale,
      translations: LocalizationService(),
      // home: const MyHomePage(title: 'Pooulp Flutter Demo Home Page'),
    );
  }
}
