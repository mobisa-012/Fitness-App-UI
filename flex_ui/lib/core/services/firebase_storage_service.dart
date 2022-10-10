import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flex_ui/core/services/user_service.dart';


class FirebaseStorageService {
  FirebaseStorage storage = FirebaseStorage.instance;
  static Future<void> listExample() async {
    ListResult result = await FirebaseStorage.instance.ref().listAll();
    for (var element in result.items) {
      // ignore: avoid_print
      print(element.name);
    }
  }

  static Future<bool> uploadImage({required String filePath}) async {
    File file = File(filePath);
    try {
      final User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        TaskSnapshot upload = await FirebaseStorage.instance.ref('user_logos/${user.uid}.png').putFile(file);
        String downloadUrl = await upload.ref.getDownloadURL();
        await UserService.editPhoto(downloadUrl);
        return true;
      }
      return false;
    } catch (e) {
      // ignore: avoid_print
      print(e);
      return false;
    }
  }
}