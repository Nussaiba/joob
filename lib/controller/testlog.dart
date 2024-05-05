import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Auth extends GetxController {
// Instances
  final _auth = FirebaseAuth.instance;
  final _googleSignIn = GoogleSignIn();
  // Google Authentication
  late final GoogleSignInAuthentication? _googleAuth;

  /// [signInWithGoogle] -- Sign In with Google
  Future<OAuthCredential?> signInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      _googleAuth = await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        idToken: _googleAuth?.idToken,
        accessToken: _googleAuth?.accessToken,
      );
      await _auth.signInWithCredential(credential);
      return credential;
    } catch (e) {
      _googleAuth = null;
      if (_googleAuth == null) {
        print("null");
      }
      //   YaLogger.debugPrintError(e.toString());
      return Future.error(e);
    }
  }
}
