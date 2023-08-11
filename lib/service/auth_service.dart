import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationService {
  static final _googleSignIn = GoogleSignIn();

  static Future<GoogleSignInAccount?> login() => _googleSignIn.signIn();
  static GoogleSignInAccount? currentUser() => _googleSignIn.currentUser;
  static Future<GoogleSignInAccount?> googleUser() =>
      _googleSignIn.signInSilently();
  static Future<bool> isSignedIn() => _googleSignIn.isSignedIn();
  static Future<GoogleSignInAccount?> signOut() => _googleSignIn.signOut();
}
