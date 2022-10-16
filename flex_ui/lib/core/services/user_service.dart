// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flex_ui/core/extensions/exceptions.dart';
import 'package:flex_ui/core/services/auth_service.dart';

class UserService {
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  static Future<bool> editPhoto(String photoUrl) async {
    try {
      await _firebaseAuth.currentUser?.updatePhotoURL(photoUrl);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static Future<bool> changeUserData(
      {required String displayName, required String email}) async {
    try {
      await _firebaseAuth.currentUser?.updateDisplayName(displayName);
      await _firebaseAuth.currentUser?.updateEmail(email);
      return true;
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }

  static Future<bool> changePassword({required String newPassword}) async {
    try {
      await _firebaseAuth.currentUser?.updatePassword(newPassword);
      return true;
    } on FirebaseAuthException catch (e) {
      throw CustomFirebaseException(getExceptionMessage(e));
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
