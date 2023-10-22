import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'autentica.dart';

Future<void> main() async {
  //await FirebaseApp();

  runApp(LoginApp());
}

class LoginApp extends StatefulWidget {
  @override
  _LoginAppState createState() => _LoginAppState();
}

class _LoginAppState extends State<LoginApp> {
  // Controladores de texto
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Instancia de FirebaseAuth
  final FirebaseAuth _auth = FirebaseAuth.instance;

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
    controller: _emailController,
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
    controller: _passwordController,
    ),

    SizedBox(height: 20.0),
    // Botón de inicio de sesión
    ElevatedButton(
    onPressed: () async {
    // Obtiene los datos de inicio de sesión del usuario
    final String email = _emailController.text;
    final String password = _passwordController.text;

// Intenta iniciar sesión al usuario
      try {
        // Llama al método signInWithEmailAndPassword()
        final UserCredential? user = await Autentica.signInWithEmailAndPassword(email, password);

        // Si la autenticación es exitosa, navega a la pantalla principal
        if (user != null) {
          Navigator.pushNamed(context, '/home');
        }
      } on FirebaseAuthException catch (e) {
        // Si la autenticación falla, muestra un mensaje de error
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.code),
          ),
        );
      }
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

      SizedBox(height: 20.0),
      // Botón de registro
      TextButton(
        onPressed: () {
          // Navega a la pantalla de registro
          Navigator.pushNamed(context, '/registro');
        },
        child: Text('Registrarse'),
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


