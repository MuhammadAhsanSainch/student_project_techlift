import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<GoogleSignInAccount> signInWithGoogle() async {
    GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
    return googleSignInAccount!;
  }

  // Future<Void> signOut() async {
  //   await _googleSignIn.signOut();
  // }
}
