import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class Autentica {
  // Instancia de FirebaseAuth
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  // Inicializa Firebase
  static Future<void> initFirebase() async {
    await Firebase.initializeApp();
  }

  // Sign in con correo electrónico y contraseña
  static Future<UserCredential?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return null;
    }
  }

  // Sign out
  static Future<void> signOut() async {
    await _auth.signOut();
  }
}
