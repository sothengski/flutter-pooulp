import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'core/core.dart';
import 'data/data.dart';
import 'routes/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init(LocalStorage.credentialName);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    // DeviceOrientation.portraitDown,
  ]);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.light,
    // const SystemUiOverlayStyle(
    //   systemNavigationBarColor: Colors.blue, // navigation bar color
    //   statusBarColor: Colors.pink, // status bar color
    // ),
  );
  await initialConfig();
  final storage = Get.find<StorageServices>();

  runApp(MyApp(storageServices: storage));
}

class MyApp extends StatelessWidget {
  final StorageServices? storageServices;
  const MyApp({
    Key? key,
    this.storageServices,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // builder: (context, child) => GestureDetector(
      //   onTap: () {
      //     unFocusKeyBoard(context);
      //   },
      //   child: child,
      // ),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: child!,
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
      locale: storageServices!.languageCode == 'km'
          ? const Locale('km', 'KH')
          : storageServices!.languageCode == 'zh'
              ? const Locale('zh', 'ZH')
              : const Locale('en', 'US'),

      fallbackLocale: LocalizationService.fallbackLocale,
      translations: LocalizationService(),
      // home: const MyHomePage(title: 'Pooulp Flutter Demo Home Page'),
    );
  }
}
