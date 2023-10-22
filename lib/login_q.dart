
import 'package:flutter/material.dart';

void main() {
  runApp(LoginApp());
}

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  // Icono (puedes cambiar el icono según tus preferencias)
                  Container(
                    width: 100.0,  // Ancho del icono
                    height: 100.0,  // Altura del icono
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),  // Bordes redondeados para hacerlo circular
                      border: Border.all(
                        width: 2.0,  // Ancho del borde
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),  // Espaciado interno para el icono
                      child: Image.asset(
                        'images/CARTAINC_LOGO.png',  // Ruta de la imagen
                      ),
                    ),
                  ),

                  SizedBox(height: 20.0),
                  // Campo de usuario
                  TextFormField(
                    style: TextStyle(color: Colors.black), // Cambia el color del texto a negro
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white, // Cambia el color de fondo a blanco
                      hintText: 'Correo electrónico',
                      contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0), // Ajusta el espaciado horizontal y vertical
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),

                  SizedBox(height: 20.0), // Agrega espacio vertical entre los campos

// Campo de contraseña
                  TextFormField(
                    obscureText: true,
                    style: TextStyle(color: Colors.black), // Cambia el color del texto a negro
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white, // Cambia el color de fondo a blanco
                      hintText: 'Contraseña',
                      contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0), // Ajusta el espaciado horizontal y vertical
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),

                  SizedBox(height: 20.0),
                  // Enlace "Olvidé mi contraseña"
                  GestureDetector(
                    onTap: () {
                      // Agrega la lógica para manejar el enlace "Olvidé mi contraseña" aquí
                    },
                    child: Text(
                      'Olvidé mi contraseña',
                      style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  // Botón de inicio de sesión
                  ElevatedButton(
                    onPressed: () {
                      // Agrega la lógica para el inicio de sesión aquí
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white, // Cambia el color del botón a blanco
                      onPrimary: Colors.black, // Cambia el color del texto a negro
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: Text('Iniciar sesión'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}