/// This well just test
import "dart:typed_data";

import "package:http/http.dart" as http;

// geting the first step
Future<http.Response> getAnnResp(Uint8List fileBytes, String fileName) async {
  final uri = Uri.parse("http://127.0.0.1:5000/annModel");

  final request = http.MultipartRequest("POST", uri);
  request.files.add(
    http.MultipartFile.fromBytes(
      'imagefile', // Key to match the backend
      fileBytes,
      filename: fileName,
    ),
  );

  final streamedResponse = await request.send();
  return http.Response.fromStream(streamedResponse);
}
