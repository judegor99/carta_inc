//ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import 'menu.dart';

class MenuItemImage {
  final String image;

  MenuItemImage({required this.image});
}

class UploadImageScreen extends StatefulWidget {
  const UploadImageScreen({super.key});

  @override
  _UploadImageScreenState createState() => _UploadImageScreenState();
}

class _UploadImageScreenState extends State<UploadImageScreen> {
  File? imageFile;

  Future<void> _pickImage() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        imageFile = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cargar Imagen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (imageFile != null)
              Image.file(
                imageFile!,
                height: 100,
              ),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Cargar Imagen'),
            ),
            if (imageFile != null)
              ElevatedButton(
                onPressed: () {
                  // Usamos el operador ?? para proporcionar un valor predeterminado al objeto MenuState
                  final menuState = Provider.of<MenuState>(context, listen: false) ?? MenuState();
                  final menuItem = MenuItemImage(image: imageFile!.path);
                  menuState.addItem(menuItem as MenuItem);
                  setState(() {
                    imageFile = null;
                  });
                  Navigator.pop(context);
                },
                child: Text('Guardar en el Menu'),
              ),
          ],
        ),
      ),
    );
  }
}
