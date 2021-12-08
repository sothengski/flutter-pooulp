import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'core/core.dart';
import 'routes/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    // DeviceOrientation.portraitDown,
  ]);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.light,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: (context, child) => GestureDetector(
        onTap: () {
          unFocusKeyBoard(context);
        },
        child: child,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splashRoute,
      getPages: AppPages.routes,
      unknownRoute: AppPages.unknownRoute,
      defaultTransition: Transition.fade,
      title: 'Pooulp Flutter',
      theme: ThemeManager.createTheme(
        AppThemeLight(),
      ),
      // home: const MyHomePage(title: 'Pooulp Flutter Demo Home Page'),
    );
  }
}
