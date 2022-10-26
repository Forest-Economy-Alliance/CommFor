import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logger/logger.dart';

class FirebaseAuthService {
  Logger logger = Logger();
  String? _username;

  User? get user => FirebaseAuth.instance.currentUser;
  bool? get isUserAdmin => user?.email?.endsWith('@dev.com');

  Stream<User?> get authStream => FirebaseAuth.instance.userChanges();
  Future<String?> get userName async {
    if (user == null) return null;
    if (_username != null) return _username;
    final db = FirebaseFirestore.instance;
    final map = await db.collection("users").doc(user!.uid).get();
    _username = map.get('username');
    return _username;
  }

  Future<UserCredential?> registerWithEmailAndPassword(
      {required String email,
      required String password,
      required String org,
      required String username,
      required String country}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final db = FirebaseFirestore.instance;
      db.collection("users").doc(credential.user!.uid).set(
        {
          "username": username,
          "organisation": org,
          "country": country.toLowerCase(),
        },
        SetOptions(merge: true),
      ).onError(
        (error, stackTrace) => logger.e(
          "Error settings the account details",
          error,
          stackTrace,
        ),
      );
      return credential;
    } on Exception catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  Future<UserCredential?> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
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

  Future<bool?> forgotPassword(String email) async {
    try {
      FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        logger.e('No user found for that email.');
        Fluttertoast.showToast(
          msg: "There is no user with the email registered",
          toastLength: Toast.LENGTH_LONG,
        );
      } else if (e.code == 'invalid-email') {
        logger.e('The email is invalid');
        Fluttertoast.showToast(
          msg: "The email is invalid",
          toastLength: Toast.LENGTH_LONG,
        );
      }
      return false;
    } catch (e) {
      logger.e(e);
      return null;
    }
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }
}
