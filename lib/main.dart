import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'crea.dart';
import 'menu.dart';  // Importa el archivo menu.dart que creamos anteriormente
import 'uploadimg.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => MenuState(),  // Inicializa el estado global del menú
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'CARTA INC',
          style: TextStyle(
            fontSize: 24.0,
          ),
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            height: 2.0,
            color: Colors.white,
          ),
          Expanded(
            child: Center(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 20.0,
                crossAxisSpacing: 20.0,
                padding: const EdgeInsets.all(20.0),
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => CreaMenuScreen()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      onPrimary: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.create, size: 48.0),
                        SizedBox(height: 8.0),
                        Text('Crear tu menú'),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MenuScreen()));
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    child: Consumer<MenuState>(
                      builder: (context, menuState, child) {
                        final itemCount = menuState.menuItems.length;
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.accessibility, size: 48.0),
                            SizedBox(height: 8.0),
                            Text('Accede a tu menú ($itemCount)'),  // Muestra la cantidad de elementos
                          ],
                        );
                      },
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ConfiguraMenuScreen()));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.settings, size: 48.0),
                        SizedBox(height: 8.0),
                        Text('Configura tu menú'),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => GeneraMenuScreen()));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.restaurant_menu, size: 48.0),
                        SizedBox(height: 8.0),
                        Text('Genera tu menú'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Las otras clases (CrearMenuScreen, ConfiguraMenuScreen, GeneraMenuScreen) se mantienen igual.

// Define las pantallas para cada botón (igual que en el ejemplo anterior)

class CrearMenuScreen extends StatelessWidget {
  const CrearMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear tu menu'),
      ),
      body: const Center(
        child: Text('Contenido de la pantalla "Crear tu menu"'),
      ),
    );
  }
}

class AccedeMenuScreen extends StatelessWidget {
  const AccedeMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accede a tu menu'),
      ),
      body: const Center(
        child: Text('Contenido de la pantalla "Accede a tu menu"'),
      ),
    );
  }
}

class ConfiguraMenuScreen extends StatelessWidget {
  const ConfiguraMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configura tu menu'),
      ),
      body: const Center(
        child: Text('Contenido de la pantalla "Configura tu menu"'),
      ),
    );
  }
}

class GeneraMenuScreen extends StatelessWidget {
  const GeneraMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Genera tu menu'),
      ),
      body: const Center(
        child: Text('Contenido de la pantalla "Genera tu menu"'),
      ),
    );
  }
}
