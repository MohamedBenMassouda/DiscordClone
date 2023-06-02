import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthManager {
  static final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: <String>[
      'email',
      'profile',
    ],
  );

  static final FirebaseAuth auth = FirebaseAuth.instance;

  static Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return null;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );

      final UserCredential userCredential =
          await auth.signInWithCredential(credential);

      final User? user = userCredential.user;
      if (user == null) {
        return null;
      }

      // After the user verifies their email, save the user in the database
      saveUserToDatabase(user, googleUser.displayName ?? "", "");

      _googleSignIn.disconnect();

      return user;
    } catch (error) {
      return null;
    }
  }

  static Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final UserCredential userCredential = await auth
          .signInWithEmailAndPassword(email: email, password: password);

      final User? user = userCredential.user;
      if (user == null) {
        return null;
      }

      return user;
    } catch (error) {
      print(error);
      return null;
    }
  }

  static Future<User?> registerWithEmailAndPassword(
      String email, String password, String userName) async {
    try {
      final UserCredential userCredential =
          await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final User? user = userCredential.user;
      if (user == null) {
        return null;
      }

      await FirebaseAuth.instance.currentUser!.updateDisplayName(userName);

      // After the user verifies their email, save the user in the database
      saveUserToDatabase(user, userName, password);

      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        return null;
      } else {
        throw Exception('Unknown error occurred');
      }
    }
  }

  static Future<void> saveUserToDatabase(User user, String displayName, String password) async {
    // Saving the password as is is not a good idea, but this is just a demo

    // Save the user to the database with the collection uid as the user uid
    await FirebaseFirestore.instance.collection("users").doc(user.uid).set({
      "uid": user.uid,
      "email": user.email,
      "displayName": user.displayName ?? displayName,
      "photoURL": user.photoURL,
      "password": password,
      "emailVerified": user.emailVerified,
      "servers": [],
    });
  }
}
