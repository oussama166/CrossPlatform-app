import 'dart:convert';
import 'dart:html' as html;
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tp/components/MyButtonField.dart';
import 'package:tp/components/UIColors.dart';
import 'package:tp/services/AnnService.dart';

class Annpage extends StatefulWidget {
  const Annpage({Key? key}) : super(key: key);

  @override
  State<Annpage> createState() => _AnnpageState();
}

class _AnnpageState extends State<Annpage> {
  Widget imageOrPlaceholder = const Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(
        Icons.image,
        size: 100,
        color: Colors.grey,
      ),
      SizedBox(height: 10),
      Text(
        "No image selected",
        style: TextStyle(
          color: Colors.grey,
          fontSize: 16,
          fontStyle: FontStyle.italic,
        ),
      ),
    ],
  );

  String resultMessage = "";
  String? predictedClass;

  void pickImageFromGallery() {
    html.FileUploadInputElement uploadInput = html.FileUploadInputElement();
    uploadInput.accept = 'image/*'; // Limit to image files
    uploadInput.click();

    uploadInput.onChange.listen((e) async {
      final file = uploadInput.files?.first;
      if (file != null) {
        final reader = html.FileReader();
        reader.readAsArrayBuffer(file); // Read file as byte array
        reader.onLoadEnd.listen((_) async {
          if (reader.result != null) {
            Uint8List fileBytes = reader.result as Uint8List;
            String fileName = file.name;

            // Update the UI with the image preview
            setState(() {
              imageOrPlaceholder = Image.memory(
                fileBytes,
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              );
            });

            // Send the image to the server
            final response = await getAnnResp(fileBytes, fileName);
            debugPrint('Server Response: ${response.body}');

            // Parse the response and update the UI
            final responseJson = json.decode(response.body);
            setState(() {
              resultMessage = responseJson['message'];
              predictedClass = responseJson['predicted_class_label'];
            });
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ANN Model",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        centerTitle: true,
        backgroundColor: UIColors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            MyButton(
              text: "Open Image Picker",
              onTap: pickImageFromGallery,
              padding: 15,
              bgcolor: UIColors.white,
              fgcolor: UIColors.black,
              fontSize: 16,
              borderColor: UIColors.black,
              borderWidth: 2,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Center(
                child: Column(
                  children: [
                    // Image and Prediction Result Section
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: imageOrPlaceholder,
                        ),
                        const SizedBox(width: 20),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (predictedClass != null)
                              Text(
                                'Predicted Class: $predictedClass',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            if (resultMessage.isNotEmpty)
                              Text(
                                resultMessage,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.green,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
