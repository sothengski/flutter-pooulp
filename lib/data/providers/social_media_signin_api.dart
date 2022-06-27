import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInApi {
  GoogleSignInApi();
  static final googleSignIn = GoogleSignIn();

  static Future<GoogleSignInAccount?> login() => googleSignIn.signIn();

  static Future<GoogleSignInAccount?> handleSignOut() =>
      googleSignIn.disconnect();

  static Future<GoogleSignInAuthentication?> getUserToken() =>
      googleSignIn.signIn().then(
            (result) => result!.authentication,
            //         result!.authentication.then((googleKey) {
            //       googleKey;
            //       print("accessToken:: ${googleKey.accessToken}");
            //       print("idToken:: ${googleKey.idToken}");
            //     }).catchError((err) {
            //       print('inner error');
            //     }),
            //   )
            //   .catchError((err) {
            // print('error occured');
            // }
          );
}
