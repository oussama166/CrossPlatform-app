import 'dart:html' as html;
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:tp/components/MyButtonField.dart';
import 'package:tp/components/UIColors.dart';

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

  void pickImageFromGallery() {
    html.FileUploadInputElement uploadInput = html.FileUploadInputElement();
    uploadInput.accept = 'image/*'; // Limit to image files
    uploadInput.click();

    uploadInput.onChange.listen((e) async {
      final file = uploadInput.files?.first;
      if (file != null) {
        final reader = html.FileReader();
        reader.readAsDataUrl(file);
        reader.onLoadEnd.listen((_) {
          setState(() {
            imageOrPlaceholder = Image.network(
              reader.result as String,
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            );
          });
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
                child: imageOrPlaceholder,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
