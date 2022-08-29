// import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
// import 'package:get/get.dart';
// import 'package:pooulp_flutter/routes/app_routes.dart';

// // FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

// class FirebaseDynamicLinkService {
//   final FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;

//   Future<void> initLinks() async {
//     final PendingDynamicLinkData? initialLink =
//         await dynamicLinks.getInitialLink();

//     if (initialLink != null) {
//       // print("initialLink != null");

//       // await proccessLink(initialLink);
//     }

//     dynamicLinks.onLink.listen((PendingDynamicLinkData? dynamicLink) async {
//       // print("initialLink listen");
//       final Uri uri = dynamicLink!.link;
//       // final queryParams = uri.queryParameters;
//       if (uri.path == '/joboffers/') {
//         Get.offNamed(Routes.profileRoute);
//         // print("====profileRoute====");
//       }
//       // await proccessLink(dynamicLink);
//       // Navigator.pushNamed(context, dynamicLinkData.link.path);
//     }).onError((error) {
//       // print(error.toString());
//     });
//   }

//   Future<void> proccessLink(PendingDynamicLinkData? dynamicLinkData) async {
//     if (dynamicLinkData != null) {
//       final Uri uri = dynamicLinkData.link;
//       // final queryParams = uri.queryParameters;
//       if (uri.path == '/joboffers/') {
//         Get.offNamed(Routes.profileRoute);
//       }
//       // if (queryParams.isNotEmpty) {
//       //   final String userName = queryParams["username"]!;
//       //   // verify the username is parsed correctly
//       //   print("My users username is: $userName");
//       // }
//     }
//   }

//   Future<Uri> createDynamicLink({bool? short = true}) async {
//     // setState(() {
//     //   _isCreatingLink = true;
//     // });

//     final DynamicLinkParameters parameters = DynamicLinkParameters(
//       uriPrefix: 'https://reactnativefirebase.page.link',
//       longDynamicLink: Uri.parse(
//         'https://reactnativefirebase.page.link/?efr=0&ibi=io.invertase.testing&apn=io.flutter.plugins.firebase.dynamiclinksexample&imv=0&amv=0&link=https%3A%2F%2Ftest-app%2Fhelloworld&ofl=https://ofl-example.com',
//       ),
//       link: Uri.parse('https://test-app/helloworld'),
//       androidParameters: const AndroidParameters(
//         packageName: 'io.flutter.plugins.firebase.dynamiclinksexample',
//         minimumVersion: 0,
//       ),
//       iosParameters: const IOSParameters(
//         bundleId: 'io.invertase.testing',
//         minimumVersion: '0',
//       ),
//     );

//     Uri url;
//     if (short!) {
//       final ShortDynamicLink shortLink =
//           await FirebaseDynamicLinks.instance.buildShortLink(parameters);
//       url = shortLink.shortUrl;
//     } else {
//       url = await FirebaseDynamicLinks.instance.buildLink(parameters);
//     }
//     // print('url: $url');
//     return url;

//     // setState(() {
//     //   _linkMessage = url.toString();
//     //   _isCreatingLink = false;
//     // });
//   }
// }

// //   Future<void> fetchLinkData() async {
// //   // FirebaseDynamicLinks.getInitialLInk does a call to firebase to get us the real link because we have shortened it.
// //   final link = await FirebaseDynamicLinks.instance.getInitialLink();

// //   // This link may exist if the app was opened fresh so we'll want to handle it the same way onLink will.
// //   handleLinkData(link!);

// //   // This will handle incoming links if the application is already opened
// //   FirebaseDynamicLinks.instance.onLink(
// //     onSuccess: (PendingDynamicLinkData dynamicLink) async {
// //       handleLinkData(dynamicLink);
// //     },
// //     // onError: (OnLinkErrorException e) async {
// //     //   print(e.message);
// //     // },
// //   );
// // }

// // void handleLinkData(PendingDynamicLinkData data) {
// //   final Uri uri = data.link;
// //   final queryParams = uri.queryParameters;
// //   if (queryParams.isNotEmpty) {
// //     final String userName = queryParams["username"]!;
// //     // verify the username is parsed correctly
// //     print("My users username is: $userName");
// //   }
// // }

// // void initDynamicLinks() {
// //   FirebaseDynamicLinks.instance.onLink(
// //     onSuccess: (PendingDynamicLinkData? dynamicLink) async {
// //       final Uri? deepLink = dynamicLink?.link;

// //       if (deepLink != null) {
// //         print('deepLink data: ${deepLink.toString()}');
// //       }
// //     },
// //     onError: (OnLinkErrorException e) async {
// //       print(e.message);
// //     },
// //   );
// // }



// // Future<Uri> createDynamicLink({required String? userName}) async {
// //   final DynamicLinkParameters parameters = DynamicLinkParameters(
// //     // This should match firebase but without the username query param
// //     uriPrefix: 'https://test.page.link',
// //     // This can be whatever you want for the uri, https://yourapp.com/groupinvite?username=$userName
// //     link: Uri.parse('https://test.page.link/groupinvite?username=$userName'),
// //     androidParameters: const AndroidParameters(
// //       packageName: 'com.test.demo',
// //       minimumVersion: 1,
// //     ),
// //     // iosParameters: const IOSParameters(
// //     //   bundleId: 'com.test.demo',
// //     //   minimumVersion: '1',
// //     //   appStoreId: '',
// //     // ),
// //   );
// //   // final ShortDynamicLink shortLink = await parameters.buildShortLink();
// //   // final Uri url = shortLink.shortUrl;
// //   // await parameters.buildUrl();

// //   // return url;

// //   // final ShortDynamicLink shortenedLink = await DynamicLinkParameters.shortenUrl(
// //   //   Uri.parse(
// //   //     'https://example.page.link/?link=https://example.com/&apn=com.example.android&ibn=com.example.ios',
// //   //   ),
// //   //   DynamicLinkParametersOptions(ShortDynamicLinkPathLength.unguessable),
// //   // ) as ShortDynamicLink;

// //   // final Uri shortUrl = shortenedLink.shortUrl;

// //   final dynamicUrl = await parameters.buildShortLink();
// //   final Uri shortUrl = shortDynamicLink.shortUrl;
// //   return shortUrl;
// //   // final link = await parameters.buildUrl();
// //   // final ShortDynamicLink shortenedLink = await DynamicLinkParameters.shortenUrl(
// //   //   link,
// //   //   DynamicLinkParametersOptions(
// //   //       shortDynamicLinkPathLength: ShortDynamicLinkPathLength.unguessable),
// //   // );
// //   // return shortenedLink.shortUrl;
// // }

//   // Future createDynamicLink(
//   //   BuildContext context,
//   //   String title,
//   //   String image,
//   //   String postId,
//   // ) async {
//   //   const bool short = false;
//   //   final DynamicLinkParameters parameters = DynamicLinkParameters(
//   //     uriPrefix: 'https://helpmechoose.page.link',
//   //     link: Uri.parse('https://helpmechoose.page.link/dynamiclink/?id=$postId'),
//   //     androidParameters: AndroidParameters(
//   //       packageName: 'com.app.helpmechoose',
//   //       minimumVersion: 0,
//   //       fallbackUrl:
//   //           Uri.parse('https://helpmechoose.page.link/dynamiclink/?id=$postId'),
//   //     ),
//   //     socialMetaTagParameters:
//   //         SocialMetaTagParameters(title: title, imageUrl: Uri.parse(image)),
//   //     // dynamicLinkParametersOptions: DynamicLinkParametersOptions(
//   //     //   shortDynamicLinkPathLength: ShortDynamicLinkPathLength.short,
//   //     // ),
//   //     iosParameters: const IOSParameters(
//   //       bundleId: 'com.app.ioshelpmechoose',
//   //       minimumVersion: '0',
//   //     ),
//   //   );

//   //   Uri url;
//   //   if (short) {
//   //     final ShortDynamicLink shortLink = await parameters.buildShortLink();
//   //     url = shortLink.shortUrl;
//   //   } else {
//   //     final Uri longLink = await parameters.buildUrl();
//   //     final ShortDynamicLink shortDynamicLink =
//   //         await DynamicLinkParameters.shortenUrl(
//   //       Uri.parse("$longLink&ofl=https://helpmechoose.app/"),
//   //     );
//   //     url = shortDynamicLink.shortUrl;
//   //     print(url);
//   //   }

//   //   return url.toString();
//   // }
//   // Future<Uri> createDynamicLink() async {
//   //   final DynamicLinkParameters parameters = DynamicLinkParameters(
//   //     uriPrefix: 'https://your.page.link',
//   //     link: Uri.parse('https://your.url.com'),
//   //     androidParameters: const AndroidParameters(
//   //       packageName: 'your_android_package_name',
//   //       minimumVersion: 1,
//   //     ),
//   //     iosParameters:const IOSParameters(
//   //       bundleId: 'your_ios_bundle_identifier',
//   //       minimumVersion: '1',
//   //       appStoreId: 'your_app_store_id',
//   //     ),
//   //   );
//   //   final dynamicUrl = await parameters.sh;
//   //   final Uri shortUrl = shortDynamicLink.shortUrl;
//   //   return shortUrl;
//   // }

//   // static Future<String> createDynamicLink({
//   //   bool? short = false,
//   //   //  StoryData storyData,
//   // }) async {
//   //   String linkMessage = '';

//   //   final DynamicLinkParameters parameters = DynamicLinkParameters(
//   //     uriPrefix: 'Write your uriPrefix here',
//   //     link: Uri.parse('Link you want to parse'),
//   //     androidParameters: const AndroidParameters(
//   //       packageName: 'your package name',
//   //       minimumVersion: 125,
//   //     ),
//   //   );

//   //   Uri url;
//   //   if (short!) {
//   //     final ShortDynamicLink shortLink = await parameters.buildShortLink();
//   //     url = shortLink.shortUrl;
//   //   } else {
//   //     url = await parameters.buildUrl();
//   //   }

//   //   linkMessage = url.toString();
//   //   return linkMessage as Future<String>;
//   // }

//   // static Future<void> initDynamicLink(BuildContext context) async {
//   //   FirebaseDynamicLinks.instance.onLink(
//   //     onSuccess: (PendingDynamicLinkData dynamicLink) async {
//   //       final Uri deepLink = dynamicLink.link;

//   //       final isStory = deepLink.pathSegments.contains('storyData');
//   //       // TODO :Modify Accordingly
//   //       if (isStory) {
//   //         final String id = deepLink.queryParameters['id'];
//   //         // TODO :Modify Accordingly

//   //         if (deepLink != null) {
//   //           // TODO : Navigate to your pages accordingly here

//   //           // try{
//   //           //   await firebaseFirestore.collection('Stories').doc(id).get()
//   //           //       .then((snapshot) {
//   //           //         StoryData storyData = StoryData.fromSnapshot(snapshot);
//   //           //
//   //           //         return Navigator.push(context, MaterialPageRoute(builder: (context) =>
//   //           //           StoryPage(story: storyData,)
//   //           //         ));
//   //           //   });
//   //           // }catch(e){
//   //           //   print(e);
//   //           // }
//   //         } else {
//   //           return null;
//   //         }
//   //       }
//   //     },
//   //     onError: (OnLinkErrorException e) async {
//   //       print('link error');
//   //     },
//   //   );

//   //   final PendingDynamicLinkData data =
//   //       await FirebaseDynamicLinks.instance.getInitialLink();
//   //   try {
//   //     final Uri deepLink = data.link;
//   //     final isStory = deepLink.pathSegments.contains('storyData');
//   //     if (isStory) {
//   //       // TODO :Modify Accordingly
//   //       final String id =
//   //           deepLink.queryParameters['id']; // TODO :Modify Accordingly

//   //       // TODO : Navigate to your pages accordingly here

//   //       // try{
//   //       //   await firebaseFirestore.collection('Stories').doc(id).get()
//   //       //       .then((snapshot) {
//   //       //     StoryData storyData = StoryData.fromSnapshot(snapshot);
//   //       //
//   //       //     return Navigator.push(context, MaterialPageRoute(builder: (context) =>
//   //       //         StoryPage(story: storyData,)
//   //       //     ));
//   //       //   });
//   //       // }catch(e){
//   //       //   print(e);
//   //       // }
//   //     }
//   //   } catch (e) {
//   //     print('No deepLink found');
//   //   }
//   // }
// // }
// // void initDynamicLinks() {
// //   FirebaseDynamicLinks.instance.onLink(
// //     onSuccess: (PendingDynamicLinkData? dynamicLink) async {
// //       final Uri? deepLink = dynamicLink?.link;

// //       if (deepLink != null) {
// //         print('deepLink data: ${deepLink.toString()}');
// //       }
// //     },
// //     onError: (OnLinkErrorException e) async {
// //       print(e.message);
// //     },
// //   );
// // }
// // Future<void> initDynamicLinks() async {
// //   FirebaseDynamicLinks.instance.onLink(
// //     onSuccess: (PendingDynamicLinkData dynamicLink) async {
// //       final Uri deepLink = dynamicLink.link;

// //       final String id = deepLink.queryParameters['id'];
// //       print(id);
// //     },
// //     onError: (OnLinkErrorException e) async {
// //       print(e.message);
// //     },
// //   );

// // //To Handle pending dynamic links add following lines
// //   final PendingDynamicLinkData data =
// //       await FirebaseDynamicLinks.instance.getInitialLink();
// //   final Uri deepLink = data.link;

// //   final String id = deepLink.queryParameters['id'];
// //   print(id);
// // }

// // final dynamicLinkParams = DynamicLinkParameters(
// //   link: Uri.parse("https://www.example.com/"),
// //   uriPrefix: "https://example.page.link",
// //   androidParameters: const AndroidParameters(packageName: "com.example.app.android"),
// //   iosParameters: const IOSParameters(bundleId: "com.example.app.ios"),
// // );
// // final dynamicLink =
// //     await FirebaseDynamicLinks.instance.buildShortLink(dynamicLinkParams);
