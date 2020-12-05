import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Authentication {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  bool _loggedIn = false;

  bool get loggedIn => _loggedIn;

  Future<User> googleSignIn() async {
    final GoogleSignInAccount googleSignInAccount =
        await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;
    final AuthCredential authCredential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken);
    final UserCredential userCredential =
        await _firebaseAuth.signInWithCredential(authCredential);
    final User user = userCredential.user;

    assert(user.displayName != null && user.email != null);
    print(user.displayName);
    print(user.refreshToken);

    final User currentUser = _firebaseAuth.currentUser;
    assert(currentUser.uid == user.uid);

    print("loggedIN = true");
    _loggedIn = true;

    return user;
  }

  Future googleSignOut() async {
    try {
      await _firebaseAuth.signOut();
      await _googleSignIn.signOut();
      print("loggedIn = false");
      _loggedIn = false;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  User getCurrentUser() {
    return _firebaseAuth.currentUser;
  }
}
