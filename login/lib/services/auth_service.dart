import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  // Google Sign In
  Future<User?> signInWithGoogle() async {
    try {
      // Begin interactive sign-in process
      final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

      // Obtain auth details from the request
      final GoogleSignInAuthentication gAuth = await gUser!.authentication;

      // Create a new credential for the user
      final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken,
        idToken: gAuth.idToken,
      );

      // Finally, let's sign in
      final UserCredential authResult =
      await FirebaseAuth.instance.signInWithCredential(credential);

      // Return the user from the authentication result
      return authResult.user;
    } catch (e) {
      print('Error during Google Sign In: $e');
      return null;
    }
  }

  // Google Sign Out
// AuthService class
  Future<void> signOutGoogle() async {
    try {
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      print('Error during Google Sign Out: $e');
    }
  }

  }
