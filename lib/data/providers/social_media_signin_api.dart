// import 'package:google_sign_in/google_sign_in.dart';

// class GoogleSignInApi {
//   GoogleSignInApi();
//   static final googleSignIn = GoogleSignIn(
//     scopes: <String>['email', 'profile'],
//   );

//   static Future<GoogleSignInAccount?> login() => googleSignIn.signIn();

//   static Future<void> handleSignOut() => googleSignIn.disconnect();

//   static Future<GoogleSignInAuthentication?> getUserToken() async {
//     final result = await googleSignIn.signIn();
//     return result?.authentication;
//   }
// }
