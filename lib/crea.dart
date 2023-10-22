import 'package:flutter/material.dart';
import 'agrega.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CreaMenuScreen(),
    );
  }
}

class CreaMenuScreen extends StatelessWidget {
  final TextEditingController _nombreOtraComidaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crea tu menú'),
      ),
      body: Center(
        child: ListView(
          children: [
            _buildFoodType(context, 'Comida asiática', 'images/comida-asiatica.webp', [
              'Sub-Opción 1',
              'Sub-Opción 2',
              'Sub-Opción 3',
              'Sub-Opción 4',
              'Sub-Opción 5',
            ]),
            _buildFoodType(context, 'Comida mexicana', 'images/COMIDA MEXICANA.jpg', [
              'Sub-Opción A',
              'Sub-Opción B',
              'Sub-Opción C',
              'Sub-Opción D',
              'Sub-Opción E',
            ]),
            _buildFoodType(context, 'Comida italiana', 'images/COMIDA ITALIANA.jpg', [
              'Sub-Opción I',
              'Sub-Opción II',
              'Sub-Opción III',
              'Sub-Opción IV',
              'Sub-Opción V',
            ]),
            _buildOtraComidaButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildFoodType(BuildContext context, String foodType, String imagePath, List<String> subOptions) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Column(
          children: [
            ListTile(
              leading: Image.asset(
                imagePath,
                height: 100,
              ),
              title: Text(foodType),
            ),
            ExpansionTile(
              title: Text('Seleccionar sub-opción'),
              children: subOptions.map((option) {
                return ListTile(
                  title: Text(option),
                  onTap: () {
                    _navigateToAgrega(context, foodType, imagePath, option);
                  },
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOtraComidaButton(BuildContext context) {
    final String otraComidaImage = 'images/COMIDA OTRA.jpg'; // Nueva ruta de la imagen

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Column(
          children: [
            ListTile(
              leading: Image.asset(
                otraComidaImage,
                height: 100,
              ),
              title: Text('Otra Comida'),
            ),
            ElevatedButton(
              onPressed: () {
                _showNombreOtraComidaDialog(context, otraComidaImage);
              },
              child: Text('Agregar Otra Comida'),
            ),
          ],
        ),
      ),
    );
  }

  void _showNombreOtraComidaDialog(BuildContext context, String imagePath) {
    showDialog(
      context: context,
      builder: (context) {
        String nombreOtraComida = '';

        return AlertDialog(
          title: Text('Nombre para Otra Comida'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _nombreOtraComidaController,
                decoration: InputDecoration(labelText: 'Nombre'),
                onChanged: (value) {
                  nombreOtraComida = value;
                },
              ),
              Image.asset(
                imagePath,
                height: 100,
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                if (nombreOtraComida.isNotEmpty) {
                  _navigateToAgrega(context, 'Otra Comida', imagePath, nombreOtraComida);
                }
              },
              child: Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }

  void _navigateToAgrega(BuildContext context, String foodType, String imagePath, String subOptionName) {
    final subOptionInfo = SubOptionInfo(
      foodType: foodType,
      subOptionName: subOptionName,
      subOptionImage: imagePath,
    );

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AgregaScreen(subOptionInfo: subOptionInfo),
      ),
    );
  }
}