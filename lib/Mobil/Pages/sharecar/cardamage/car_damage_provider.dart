import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class CarDamageProvider extends ChangeNotifier {
  Uint8List? _processedImage;
  List<dynamic>? _detections;

  Uint8List? get processedImage => _processedImage;
  List<dynamic>? get detections => _detections;

  // Upload image to Flask API for damage detection
  Future<void> uploadImageFromUrl(String imageUrl) async {
    var url = Uri.parse('http://192.168.43.212:5000/detect_damage'); // Flask API address
    var request = http.MultipartRequest('POST', url);

    try {
      // Fetch the image from the given URL
      final response = await http.get(Uri.parse(imageUrl));

      if (response.statusCode == 200) {
        // Add the fetched image as bytes to the Multipart request
        request.files.add(http.MultipartFile.fromBytes(
          'image', 
          response.bodyBytes,
          filename: 'image_from_url.png', // You can give any filename here
        ));

        // Send the request to the Flask API
        var apiResponse = await request.send();
        var responseData = await http.Response.fromStream(apiResponse);

        if (apiResponse.statusCode == 200) {
          var decodedData = json.decode(responseData.body);

          // Convert processed image from base64 to Uint8List
          Uint8List imageBytes = base64Decode(decodedData['image']);

          _processedImage = imageBytes;
          _detections = decodedData['detections'];
          notifyListeners(); // Notify listeners of state change
        } else {
          print('API error: ${apiResponse.statusCode}');
        }
      } else {
        print('Failed to fetch image from URL: ${response.statusCode}');
      }
    } catch (e) {
      print('Error uploading image from URL: $e');
    }
  }
}