import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'agrega.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class MenuItem {
  final String name;
  final String description;
  final double price;
  final String image;

  MenuItem({
    required this.name,
    required this.description,
    required this.price,
    required this.image,
  });
}

class MenuState extends ChangeNotifier {
  String restaurantName = 'Nombre del Restaurante';
  String? restaurantLogo;
  final List<MenuItem> menuItems = [];

  void addItem(MenuItem item) {
    menuItems.add(item);
    notifyListeners();
  }

  void reorderItems(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    final item = menuItems.removeAt(oldIndex);
    menuItems.insert(newIndex, item);
    notifyListeners();
  }

  Future<void> setRestaurantLogo(File logoFile) async {
    final appDir = await getApplicationDocumentsDirectory();
    final fileName = 'restaurant_logo.jpg';
    final savedImage = await logoFile.copy('${appDir.path}/$fileName');
    restaurantLogo = savedImage.path;
    notifyListeners();
  }
}

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final menuState = context.watch<MenuState>();

    return Scaffold(
      appBar: AppBar(
        title: Text(menuState.restaurantName),
        actions: [
          GestureDetector(
            onTap: () async {
              final imagePicker = ImagePicker();
              final pickedImage = await imagePicker.pickImage(
                source: ImageSource.gallery,
              );

              if (pickedImage != null) {
                context.read<MenuState>().setRestaurantLogo(File(pickedImage.path));
              }
            },
            child: Container(
              margin: EdgeInsets.all(8.0),
              child: menuState.restaurantLogo != null
                  ? Image.file(
                File(menuState.restaurantLogo!),
                height: 30,
              )
                  : Icon(Icons.add),
            ),
          ),
        ],
      ),
      body: ReorderableList(
        onReorder: (oldIndex, newIndex) {
          menuState.reorderItems(oldIndex, newIndex);
        },
        child: ListView.builder(
          itemCount: menuState.menuItems.length,
          itemBuilder: (context, index) {
            final menuItem = menuState.menuItems[index];

            return ReorderableItem(
              key: ValueKey(index),
              builder: (context, state) {
                return Card(
                  elevation: 3,
                  margin: EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Image.file(
                        File(menuItem.image),
                        height: 100,
                      ),
                      ListTile(
                        title: Text(menuItem.name),
                        subtitle: Text(menuItem.description),
                        trailing: Text('\$${menuItem.price.toStringAsFixed(2)}'),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
