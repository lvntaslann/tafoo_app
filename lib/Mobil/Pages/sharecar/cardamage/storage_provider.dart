import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class StorageProvider with ChangeNotifier {
  final firebaseStorage = FirebaseStorage.instance;
  User? currentUser = FirebaseAuth.instance.currentUser;
  List<String> _imageUrls = [];
  bool _isLoading = false;
  bool _isUpLoading = false;

  List<String> get imageUrls => _imageUrls;
  bool get isLoading => _isLoading;
  bool get isUpLoading => _isUpLoading;

  // Fetch images from Firebase Storage
  Future<void> fetchImages() async {
    _isLoading = true;
    notifyListeners();
    
    try {
      final ListResult result =
          await firebaseStorage.ref('uploaded_images/').listAll();
      final urls =
          await Future.wait(result.items.map((ref) => ref.getDownloadURL()));
      _imageUrls = urls;
    } catch (e) {
      print("Error fetching images: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Delete an image from Firebase Storage
  Future<void> deleteImage(String imageUrl) async {
    try {
      _imageUrls.remove(imageUrl);
      final String path = extractPathFromUrl(imageUrl);
      await firebaseStorage.ref(path).delete();
      notifyListeners();
    } catch (e) {
      print("Error deleting image: $e");
    }
  }

  // Extract the file path from the Firebase Storage URL
  String extractPathFromUrl(String url) {
    Uri uri = Uri.parse(url);
    return uri.path.substring(1); // Removing leading '/'
  }

  // Upload an image to Firebase Storage
  Future<String?> uploadImage(ImageSource source) async {
  _isUpLoading = true;
  notifyListeners();

  final ImagePicker picker = ImagePicker();
  XFile? image = await picker.pickImage(source: source);

  if (image == null) return null; // Kullanıcı bir resim seçmezse null döner

  File file = File(image.path);

  try {
    String filePath = 'uploaded_images/${currentUser!.uid}/${DateTime.now()}';
    await firebaseStorage.ref(filePath).putFile(file);
    String downloadUrl = await firebaseStorage.ref(filePath).getDownloadURL();
    _imageUrls.add(downloadUrl);
    return downloadUrl; // Başarılı bir şekilde yüklendiğinde URL döner
  } catch (e) {
    print("Error uploading image: $e");
    return null; // Hata durumunda null döndürür
  } finally {
    _isUpLoading = false;
    notifyListeners();
  }
}
}