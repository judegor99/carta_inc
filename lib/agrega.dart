import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'menu.dart';

class SubOptionInfo {
  final String foodType;
  final String subOptionName;
  final String subOptionImage;

  SubOptionInfo({
    required this.foodType,
    required this.subOptionName,
    required this.subOptionImage,
  });
}

class AgregaScreen extends StatefulWidget {
  final SubOptionInfo subOptionInfo;

  AgregaScreen({required this.subOptionInfo});

  @override
  _AgregaScreenState createState() => _AgregaScreenState();
}

class _AgregaScreenState extends State<AgregaScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  File? _image;

  Future<void> _pickImage() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agrega/Subopcion'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (_image != null)
                Image.file(
                  _image!,
                  height: 100,
                )
              else
                GestureDetector(
                  onTap: _pickImage,
                  child: Icon(
                    Icons.add,
                    size: 100,
                  ),
                ),
              Text(widget.subOptionInfo.subOptionName),
              Text(
                'DESCRIPCIÓN',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Nombre del Producto'),
              ),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(labelText: 'Añade una descripción'),
              ),
              TextField(
                controller: priceController,
                decoration: InputDecoration(labelText: 'Precio', prefixText: '\$'),
                keyboardType: TextInputType.number,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      final name = nameController.text;
                      final description = descriptionController.text;
                      final price = double.tryParse(priceController.text) ?? 0.0;

                      if (name.isNotEmpty && price > 0) {
                        final menuItem = MenuItem(
                          name: name,
                          description: description,
                          price: price,
                          image: _image!.path,
                        );

                        final menuState = context.read<MenuState>();
                        menuState.addItem(menuItem);

                        nameController.clear();
                        descriptionController.clear();
                        priceController.clear();
                      }
                    },
                    child: Text('Agregar'),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MenuScreen()),
                      );
                    },
                    child: Text('Visualizar'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
