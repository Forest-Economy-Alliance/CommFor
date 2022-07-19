import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';

class FirebaseAuthService {
  Logger logger = Logger();
  User? user;
  Stream<User?> get authStream => FirebaseAuth.instance.userChanges();

  Future<UserCredential?> registerWithEmailAndPassword(
    String email,
    password,
  ) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on Exception catch (e) {
      rethrow;
    }
    return null;
  }

  Future<UserCredential?> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = credential.user;
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        logger.e('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        logger.e('Wrong password provided for that user.');
      }
    } catch (e) {
      logger.e(e);
    }
    return null;
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }
}
